<#if settings.pjax_enabled!false>
  <script src="${theme_base!}/source/js/plugins/jquery.pjax.js"></script>
  <script src="${theme_base!}/source/js/plugins/nprogress.min.js"></script>
  <link rel="stylesheet" href="${theme_base!}/source/css/nprogress.min.css">
  <script type="text/javascript">
    $(document).pjax(
      'a[href]:not([href^="#"]):not([data-not-pjax]):not([target^="_blank"]), form',
      '#container', {fragment: '#container', timeout: 8000});

    $(document).on('pjax:send', function () {
      NProgress.start();
    })

    $(document).on('pjax:complete', function () {
      NProgress.done();
      
      xueContext.wrapImage();

      xueContext.handleNavActive();
      
      // 重新加载 评论
      $('script[data-pjax-comment]').each(function () {
        const commentParent = $(this).parent();
        const comment = $(this).remove();
        commentParent.append(comment);
      });

      // 存在 markdown 页面的功能
      if ($("#container").find('.md-content').length > 0) {

        // 高亮代码
        xueContext.highlightCode()
  
        // 滚动动画
        xueContext.reveal()

        // 目录相关
        if (typeof tocbot !== "undefined" && document.getElementById("toc")) {
          xueContext.handleContentToc();
        }
      }

      // alipay
      if ($("#container").find('.arrow-down').length > 0) {
        xueContext.arrowDown()
      }

      // alipay
      if ($("#container").find('#alipay').length > 0) {
        xueContext.toggleAlipay()
      }

      // wechat
      if ($("#container").find('#wechat').length > 0) {
        xueContext.toggleWeChat()
      }
      
      // 获取更多
      if ($("#container").find('.more-btn').length > 0) {
        xueContext.moreBtn()
      }

      // 喜欢
      if ($("#container").find('.like-btn').length > 0) {
        xueContext.likeBtn()
      }

      // 分页
      if ($("#container").find('.pagination-circle').length > 0) {
        xueContext.pageBtn()
      }

      // 相册页面功能
      if ($("#container").find('.photos-page').length > 0) {
        xueContext.gallery()
      }

      // 图片懒加载
      xueContext.lazyloadImage()

      //重载
      if (typeof _hmt !== 'undefined') {
        // support 百度统计
        _hmt.push(['_trackPageview', location.pathname + location.search]);
      }

      if (typeof ga !== 'undefined') {
        // support google analytics
        ga('send', 'pageview', location.pathname + location.search);
      }

      if ($('#container').find('.jqcloud').length > 0) {
        renderTagCloud();
        renderCategoryCloud();

      }

      ${settings.common_js!''};

    });

    $(document).on('pjax:error', function () {
      NProgress.done();
    });

  </script>
</#if>