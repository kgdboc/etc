# linux
在v5.6.8上测试通过，仅依赖502个配置 (全部都是built-in) <br/>
除了基本的virtio驱动之外，还增加了9p文件系统, netfilter的支持,<br/>
编译出的内核大小仅3.1兆，<br/>
编译用到的.c文件仅1203个，.h文件仅1941个<br/>

extract-useful这个程序执行一次make mrproper和make，并把这个过程中用到的文件单独拷贝到一个新的目录<br/>
需要进入到Linux源码树目录下运行，并且需要准备一个配置文件并命名成.config.mini，<br/>
以及使用strictatime模式挂载内核源码树所在的分区，用法是：<br/>
extract-useful mini-linux <br/>
这会把用到的文件拷贝到mini-linux这个目录，可以在这个目录下执行make mrproper和make。<br/>

发布了一个release，是extract-useful这个程序生成的精简版Linux源码树
