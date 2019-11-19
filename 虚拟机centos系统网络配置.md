# 前提条件
在电脑中安装好虚拟机，我安装的版本为：CentOS-7-x86_64-DVD-1810
# 配置虚拟机网络
注意：虚拟机和主机ip地址要在同一个网段。
打开虚拟机，在虚拟机中点左上角选择"虚拟机"，点击"设置"，点击网络适配器2（因为之前网络适配器，后面由于不会设置，导致网络设置混乱，无法连接，所以新建了一个网络适配器），选择NAT模式，如下：
![在这里插入图片描述](https://img-blog.csdnimg.cn/20191110231510629.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQ0NDIwMjQ2,size_16,color_FFFFFF,t_70)
更改后点击确定。
接着点击左上角"编辑"，选择"虚拟网络编辑器"，选择VMnet8（即NAT模式），如下：
![在这里插入图片描述](https://img-blog.csdnimg.cn/20191110233712806.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQ0NDIwMjQ2,size_16,color_FFFFFF,t_70)
点击NAT设置，设置网关IP一般为默认：
![在这里插入图片描述](https://img-blog.csdnimg.cn/20191111221843376.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQ0NDIwMjQ2,size_16,color_FFFFFF,t_70)
接着点击DHCP设置，设置起始IP地址和终止IP地址，（如果主机的IP地址不在这个起始IP地址和终止IP地址区间内则无法连接）：
![在这里插入图片描述](https://img-blog.csdnimg.cn/2019111122201994.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQ0NDIwMjQ2,size_16,color_FFFFFF,t_70)
设置好后点击确定。
接着在虚拟机中，输入ifconfig查看ip地址及网卡信息：
![在这里插入图片描述](https://img-blog.csdnimg.cn/20191111215200441.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQ0NDIwMjQ2,size_16,color_FFFFFF,t_70)
# 配置主机IP
接着在电脑主机中选择VMnet8，如下：
![在这里插入图片描述](https://img-blog.csdnimg.cn/20191110234447928.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQ0NDIwMjQ2,size_16,color_FFFFFF,t_70)
* 注意：由于是新建的网络适配器，无法像普通的配置虚拟机网络那样进入：

```c
vi /etc/sysconfig/network-scripts/ifcfg-ens33
```
修改地址信息，因为找不到需要配置的ens37文件所在地址，但是虽然没有修改，在修改完主机VMnet8的IP地址等后，linux仍然能够ping通主机，能够上网。（可能是之前配置过ens33的原因）需要配置的可参考其他配置网络的博客：
[https://blog.csdn.net/wujiele/article/details/92803655](https://blog.csdn.net/wujiele/article/details/92803655)

双击进入，点击Ipv4，再点击属性：
![在这里插入图片描述](https://img-blog.csdnimg.cn/20191110234622168.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQ0NDIwMjQ2,size_16,color_FFFFFF,t_70)
设置IP地址如下（IP地址和虚拟机的IP地址前三段设置一样，最后一段设置不一样，默认网关前三段设置和IP地址一样，最后一位一般为1）：
![在这里插入图片描述](https://img-blog.csdnimg.cn/20191110234429825.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQ0NDIwMjQ2,size_16,color_FFFFFF,t_70)
设置好后，点击确定。
注意：需要将主机和linux系统的的防火墙关闭。
关闭linux防火墙：
* 1:查看防火状态
systemctl status firewalld
service  iptables status
* 2:暂时关闭防火墙
systemctl stop firewalld
service  iptables stop
* 3:永久关闭防火墙
systemctl disable firewalld
chkconfig iptables off
* 4:重启防火墙
systemctl enable firewalld
service iptables restart  

到这就设置完成。接着
ping ip地址：

```c
ping 192.168.14.3
```
结果：
![在这里插入图片描述](https://img-blog.csdnimg.cn/2019111023241030.png)
ping baidu，看是否能上网：
![在这里插入图片描述](https://img-blog.csdnimg.cn/20191110235720693.png)
成功。

