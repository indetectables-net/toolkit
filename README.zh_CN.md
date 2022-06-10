简体中文 | [English](README.md) | [Español](README.ES.md)


# Indetectables工具包

这个工具合集是精心制作的，目的是对恶意软件分析领域的初学者和老手都有用。它也被证明对那些破解underworld碰运气的人很有用。
它是与[manuals](https://github.com/indetectables-net/manuals)网址一起使用的最佳互补，也是与[numbered theories](https://github.com/indetectables-net/teorias-numeradas) 镜像一起合作的最佳互补。

![](assets/demo.gif)


## 优势

需要说明的是，这个软件包被认为是现存最完整、最强大的软件包。一些优点是:

1. 它包含了您在真实生活场景中可能需要的所有基本(和不太基本)工具，无论是简单的还是复杂的。

2. 该软件包集成了我们从头开始制作的通用更新程序。多亏了这一点，我们才能以自动化的方式维护所有的工具。

3. 它真的很容易扩展和修改：你只需要更新文件`bin\updater\tools.ini`，将你使用的工具整合到[updater](https://github.com/xchwarze/universal-tool-updater)，然后将你的工具链接添加到`bin\sendto\sendto`，这样它们就会出现在上下文菜单中。
4. 安装程序自动设置了我们可能需要的一切--一切，从依赖关系到环境变量，它甚至可以添加一个计划任务，每周更新整个工具包。

## 安装

1. 您可以从[release section](https://github.com/indetectables-net/toolkit/releases)下载稳定版本，也可以在那里找到安装程序。

2. 下载后，您可以使用我们专门为此目的 [开发](https://github.com/xchwarze/universal-tool-updater)通用更新程序 来更新这些工具。<br/>
您将在`bin\updater\updater.exe`文件夹中找到二进制文件。


## 工具集

这个工具包由75个应用组成，涵盖了我们执行逆向工程和二进制/恶意软件分析可能需要的一切。 <br/>
每个工具都是从他们的原发布地址/官网下载的，但是我们还是建议大家谨慎使用，尤其是那些官方页面是论坛线程的工具。经常运用常识。<br/>
您可以在[here](TOOLS.md)查看完整的工具列表。


## 关于贡献

欢迎拉取请求。如果你想提出大的改变，你应该首先创建一个关于它的Issue，这样我们都可以分析和讨论它。这些工具是用7-zip压缩的，用于命名的格式是`{name} - {version}.7z `格式
