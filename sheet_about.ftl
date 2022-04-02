<!DOCTYPE html>
<html lang="zh" class="p-0 m-0 h-full text-base sm:text-sm">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <#--添加：个人主页-->
  <link rel="stylesheet" type="text/css" href="${theme_base!}/source/custom/css/FiraCode.css">
  <link rel="stylesheet" type="text/css" href="${theme_base!}/source/custom/css/nutssss.css">
  <script src="${theme_base!}/source/js/plugins/jquery.min.js"></script>
</head>

<body id="about-body">

  <div id="box">
    <#-- 个人资料卡片 -->
    <div class="meBox">
      <#-- 头像 -->
      <div class="headPhoto"></div>
      <#-- 介绍 -->
      <div class="meBox-title">
        <p>I'm keepli</p>
        <div class="fg"></div>
      </div>
      <div class="meBox-text">
        <p>一条咸鱼<img src="${theme_base!}/source/custom/img/fish.png" alt="咸鱼"
                    style="width: 20px; vertical-align: middle;"></p>
        <p>爱好计算机</p>
        <p>瞎折腾浪费时间最在行</p>
        <p>最爱<img src="${theme_base!}/source/custom/img/002.png" alt="冰激凌"
                  style="width: 15px; vertical-align: middle;"></p>
      </div>
      <#-- 两个按钮 -->
      <div class="meBox-Button">
        <a href="http://www.keepli.cn">首页</a>
        <a href="http://wpa.qq.com/msgrd?v=3&uin=248147986&site=qq&menu=yes">联系</a>
      </div>
    </div>
  
    <#-- 伪终端介绍 -->
    <div id="cmdBox">
      <#-- 第一个终端 -->
      <div class="cmd">
        <#-- 三个按钮 -->
        <div class="click">
          <div class="red"></div>
          <div class="yellow"></div>
          <div class="green"></div>
        </div>
        <#-- 顶部标题 -->
        <div class="title">
              <span><img src="${theme_base!}/source/custom/img/001.png" alt="love"
                         style="width: 20px; vertical-align: middle;">cxx - bash</span>
        </div>
        <#-- 终端内文字 -->
        <div class="cmdText">
          <span style="color: rgb(0, 190, 0);">root@nutssss</span>
          <span style="color: blue;">~</span>
          <span style="color: rgb(39, 39, 39);">./tianqi.sh</span>
          <br/>
          <iframe scrolling="no" src="https://tianqiapi.com/api.php?style=tc&skin=pitaya" frameborder="0"
                  width="350" height="24" allowtransparency="true"></iframe>
          <br/>
          <span style="color: rgb(0, 190, 0);">root@nutssss</span>
          <span style="color: blue;">~</span>
          <span style="color: rgb(39, 39, 39);">cat /me.txt</span>
          <p>爱好计算机，会去自学自己感兴趣的一切东西</p>
          <p>略懂H5，java开发；爱好折腾去解决一切问题</p>
          <p>路上的坎一定会非常多，但</p>
          <p>在我眼里</p>
          <p>没有什么问题是尝试不能解决的，如果有那就多尝试几次甚至上百次</p>
          <p>即使前方的路看似绝境，也要有硬生生给自己开出一条路的勇气</p>
          <span style="color: rgb(0, 190, 0);">root@keepli</span>
          <span style="color: blue;">~</span>
          <span style="color: rgb(39, 39, 39);">sudo rm -rf /过去的自己/*</span>
        </div>
      </div>
      <#-- 第二个终端 -->
      <div class="cmd cmd2">
        <#-- 三个按钮 -->
        <div class="click">
          <div class="red"></div>
          <div class="yellow"></div>
          <div class="green"></div>
        </div>
        <#-- 顶部标题 -->
        <div class="title">
              <span><img src="${theme_base!}/source/custom/img/001.png" alt="love"
                         style="width: 20px; vertical-align: middle;">cxx - bash</span>
        </div>
        <#-- 终端内文字 -->
        <div class="cmdText">
          <span style="color: rgb(0, 190, 0);">root@nutssss</span>
          <span style="color: blue;">~</span>
          <span style="color: rgb(39, 39, 39);">./links.sh</span>
          <p>我的其他站点：</p>
          <ul class="ul">
            <li><a href="https://keepli.gitee.io/">Blog</a></li>
          </ul>
          <span style="color: rgb(0, 190, 0);">root@nutssss</span>
          <span style="color: blue;">~</span>
        </div>
      </div>
    </div>
</div>

<#-- 页脚 -->
<div id="about-footer">
  <#if settings.Icp??>
    <p>© HELLO | <a href="http://beian.miit.gov.cn">${settings.Icp!}</a></p>
  </#if>
  <p>THEME MADE BY <a href="https://github.com/keepli/bao">GITHUB BAO</a></p>
</div>

</body>

</html>
