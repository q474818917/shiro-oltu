shiro-oltu
============

#### 基于Authorization_code授权码认证
+ client:shiro先进入loginurl，
+ loginurl会跳转到服务器授权
+ server端输入用户名、密码成功后，redirect客户端的认证地址，并携带auth_code
+ client拦截、认证：
	+ 根据auth_code获取access_token
	+ 根据拿到的access_token获取用户信息
+ 最后根据access_token和用户信息：创建认证信息

#### 示例
请求 http://localhost:8080/shiro-oltu-client/login，完成客户端认证
