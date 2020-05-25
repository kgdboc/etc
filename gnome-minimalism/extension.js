const Main = imports.ui.main;
const Lang = imports.lang;
const { Clutter, GLib, GObject, Meta, St } = imports.gi;

function enable() {
  imports.ui.switcherPopup.POPUP_DELAY_TIMEOUT = 0; // Remove Alt+Tab Delay

  Main.overview._searchEntryBin.hide(); // Hide Search Box

  // Hide Dock
  Main.overview._dash.actor.hide();
  Main.overview._dash.actor.set_width(0);

  // Hide Frequent View
  Main.overview.viewSelector.appDisplay._controls.hide();
  Main.overview.viewSelector.appDisplay._showView(1);

  //  imports.ui.workspaceSwitcherPopup.WorkspaceSwitcherPopup.prototype.display = function() {}; // No Workspace Switcher Popup

  imports.ui.workspaceSwitcherPopup.WorkspaceSwitcherPopup.prototype.display = display;

  // Hide Workspace Thumbnails
  imports.ui.overviewControls.ThumbnailsSlider.prototype._getAlwaysZoomOut = function () {
    return false;
  };
  imports.ui.overviewControls.ThumbnailsSlider.prototype.getNonExpandedWidth = function () {
    return 0;
  };

  //Click Quit Overview
  Main.overview.viewSelector._workspacesDisplay.actor.reactive = true;
  Main.overview.viewSelector._workspacesDisplay.actor.connect(
    "button-press-event",
    function () {
      Main.overview.hide();
    }
  );

  global.display.connect(
    "window-demands-attention",
    Lang.bind(this, function (display, window) {
      Main.activateWindow(window);
    })
  ); // Steal My Focus

  Main.layoutManager.panelBox.set_position(10000, -10000); // Hide Panel

  Main.overview.viewSelector._onStageKeyPress = esc;
}

function esc(actor, event) {
  if (Main.modalCount > 1) return Clutter.EVENT_PROPAGATE;
  let modifiers = event.get_state();
  let symbol = event.get_key_symbol();
  if (symbol == Clutter.Escape) {
    if (this._searchActive) this.reset();
    else Main.overview.hide();
    return Clutter.EVENT_STOP;
  } else if (this._shouldTriggerSearch(symbol)) {
    this.startSearch(event);
  } else if (!this._searchActive && !global.stage.key_focus) {
    if (symbol == Clutter.Tab || symbol == Clutter.Down) {
      this._activePage.navigate_focus(
        null,
        Gtk.DirectionType.TAB_FORWARD,
        false
      );
      return Clutter.EVENT_STOP;
    } else if (symbol == Clutter.ISO_Left_Tab) {
      this._activePage.navigate_focus(
        null,
        Gtk.DirectionType.TAB_BACKWARD,
        false
      );
      return Clutter.EVENT_STOP;
    }
  }
  return Clutter.EVENT_PROPAGATE;
}

function display(direction, activeWorkspaceIndex) {
  this._direction = direction;
  this._activeWorkspaceIndex = activeWorkspaceIndex;

  this._redisplay();
  if (this._timeoutId != 0) GLib.source_remove(this._timeoutId);
  var display_timeout = 250;
  this._timeoutId = GLib.timeout_add(
    GLib.PRIORITY_DEFAULT,
    display_timeout,
    this._onTimeout.bind(this)
  );
  GLib.Source.set_name_by_id(this._timeoutId, "[gnome-shell] this._onTimeout");
  this._show();
}
