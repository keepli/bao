const slideUp = {
      distance: '2rem',
      origin: 'bottom',
      // opacity: 1,
      // delay:100,
      interval: 50,
      duration: 500,
      reset: true,
      // easing: 'ease-in' 
};

// 主题相关函数
const xueContext = {

  // 滚动加载动画
  reveal: function() {
      ScrollReveal().reveal('.slide-up',  slideUp);
  },

  // 深色模式
  toggleDarkMode: function () {
    $('#darkCheckbox').click(function () {
      $(document.body).toggleClass("dark");
      $('#navHeader').addClass('bg-transparent').removeClass('shadow-md')
      // 处理导航栏主题
      xueContext.handleNavTheme()
      // 检查本地缓存
      xueContext.checkLocalStorage()
      if (typeof renderComment === "function") {
        renderComment()
      }
    });
  },

  // 加载的时候检查深色模式
  loadCheckDarkMode: function () {
    var darkCheckbox = document.querySelector('#darkCheckbox')
    if (window.matchMedia && window.matchMedia(
      '(prefers-color-scheme: dark)').matches) {
      darkCheckbox.checked = true
      $(document.body).addClass("dark");
    } else if (localStorage.theme === 'dark') {
      darkCheckbox.checked = true
      $(document.body).addClass("dark");
    } else {
      darkCheckbox.checked = false
      $(document.body).removeClass("dark");
    }
  },

  // 检查本地缓存
  checkLocalStorage: function () {
    if (!localStorage.theme) {
      localStorage.setItem('theme', 'light')
    }
    if ($(document.body).hasClass('dark')) {
      localStorage.setItem('theme', 'dark')
    } else {
      localStorage.setItem('theme', 'light')
    }
  },

  // 处理界面滚动
  handleNavTheme: function () {
    // 客户端宽度小于 800, 就不需要处理了
    if (document.body.clientWidth <= 800) {
      $('#navHeader .nav').addClass('opacity-100').removeClass('opacity-0')
      return;
    }
    // 获取是否是深色模式
    const dark = $(document.body).hasClass("dark");
    const scrollTop = xueContext.scrollTop();
    // 滚动高度
    if (scrollTop > 0) {
      if (dark) {
        $('#navHeader').addClass('dark:bg-gray-800').removeClass('bg-transparent').addClass('shadow-md')
        $('.link').addClass('text-gray-100').removeClass('text-gray-800')
      } else {
        $('#navHeader').addClass('bg-white').removeClass('bg-transparent').addClass('shadow-md').removeClass('dark:bg-gray-800')
        $('.link').addClass('text-gray-800').removeClass('text-gray-100')
      }
    } else {
      $('#navHeader').addClass('bg-transparent').removeClass('dark:bg-gray-800').removeClass('bg-white').removeClass('bg-transparent').removeClass('shadow-md')
      $('.link').addClass('text-gray-100').removeClass('text-gray-800')
    }
  },

  //获取滚动条距离顶部位置
  scrollTop: function () {
    return document.documentElement.scrollTop || document.body.scrollTop;
  },

  // 处理目录
  handleContentToc: function () {
    if (document.body.clientWidth <= 800) {
      return;
    }
    xueContext.initialToc();
    xueContext.addTocFixEvent();
  },


  // 初始化目录
  initialToc: function () {
    wrapHeader();
    const headerEl = "h1,h2,h3,h4,h5,h6", //headers
      content = ".md-content"; //文章容器
    tocbot.init({
      tocSelector: "#toc",
      contentSelector: content,
      headingSelector: headerEl,
      scrollSmooth: true,
      headingsOffset: 0 - $("#postHeader").height(),
      scrollSmoothOffset: -80, // 实现点击目录精准跳转到header
      hasInnerContainers: false,
    });

    // 设置目录在页面中的正确位置
    xueContext.positionToc();
  },

  // 目录滚动时间
  addTocFixEvent: function () {
    if (!xueContext.checkToc()) {
      document.removeEventListener('scroll', xueContext.tocScroll, false);
    }
    document.addEventListener("scroll", xueContext.tocScroll, false);
  },

  // 目录滚动事件
  tocScroll: function (event) {
    const tocId = "#toc";
    const Obj = $("#tocFlag");

    //判断元素是否存在
    if (Obj.length !== 1) {
      return false;
    }

    const tocFixed = $(tocId);
    const ObjTop = Obj.offset().top - $(window).height() * 0.5;

    // 滚动条离页面顶端的距离
    const scrollTop = xueContext.scrollTop();
    const postHeaderHeight = $("#postHeader").height();
    if (scrollTop > postHeaderHeight / 2) {
      tocFixed.show();
    } else {
      tocFixed.hide();
    }

    const tocEle = document.querySelector(tocId);
    if (!tocEle || !tocEle.getBoundingClientRect()) {
      return;
    }
    const tocHeight = tocEle.getBoundingClientRect().height;
    if (scrollTop > ObjTop - tocHeight * 0.5) {
      tocFixed.addClass("toc-right-fixed");
    } else {
      tocFixed.removeClass("toc-right-fixed");
    }

    // 设置目录right
    xueContext.positionToc();
  },

  // 检查目录是否存在
  checkToc: function () {
    const tocId = "#toc";
    const Obj = $("#tocFlag");

    //判断元素是否存在
    return Obj.length === 1;

  },

  // 目录靠右
  positionToc: function () {
    const screenWidth = document.body.clientWidth;
    const tocEle = document.getElementById("toc");
    if (tocEle) {
      tocEle.style.left = (screenWidth - 768) / 2 + 820 + "px";
    }
  },

  // 处理导航目录
  handleNav: function () {
    if (document.body.clientWidth <= 800) {
      $('#navHeader .nav').addClass('opacity-100').removeClass('opacity-0')
      return;
    }
    document.addEventListener('scroll', xueContext.handleNavTheme, false);
  },

  // 处理导航目录当前状态
  handleNavActive: function () {
    const pathname = document.location.pathname;
    document.querySelectorAll('.menu-item')
      .forEach((e) => {
        $(e).removeClass('menu-active');
        if ($(e).attr('href') === pathname) {
          $(e).addClass('menu-active');
        }
      });
  },


  // 处理首页 arrow-down
  arrowDown: function () {
    $('.arrow-down').click(function () {
      const postHeight = $("#hero").height() - 56;
      window.scroll({top: postHeight, behavior: "smooth"});
    });
  },


  // alipay 按钮点击
  toggleAlipay() {
    $('#alipay').click(function () {
      $(".qrcode-wechat").addClass("hidden");
      $(".qrcode-alipay").toggleClass("hidden");
      $("#wechat i").removeClass("active-bg");
      $("#alipay i").toggleClass("active-bg");
    });
  },


  // 微信支付 按钮点击
  toggleWeChat: function () {
    $('#wechat').click(function () {
      $(".qrcode-alipay").addClass("hidden");
      $(".qrcode-wechat").toggleClass("hidden");
      $("#alipay i").removeClass("active-bg");
      $("#wechat i").toggleClass("active-bg");
    });
  },

  toggleSearchBox: function () {
    $('.search-btn').click(function () {
      $('#searchBox').toggleClass('hidden');
    });
  },

  // 分页信息
  pageBtn: function () {
    $('.pagination-circle').click(function (e) {
      const path = e.target.dataset.path
      var pageContainer = "#pageContainer";
      $.ajax({
        type: "GET",
        url: path,
        beforeSend: function () {
          $(pageContainer).empty();
          $(pageContainer).addClass("loading");
        },
        success: function (data) {
          $(pageContainer).removeClass("loading");
          $(pageContainer).empty();
          let result = $(data).find(pageContainer);
          $(pageContainer).append(result.children());
          let page = "#pagination";
          let pagination = $(data).find(page);
          $(page).empty();
          $(page).append(pagination.children());
          xueContext.lazyloadImage()
          xueContext.pageBtn();
          xueContext.reveal();
        },
        error: function () {
          $(pageContainer).empty();
          $(pageContainer).addClass("loading");
          xueContext.pageBtn();
        },
      });
    });
  },

  // 点击喜欢按钮
  likeBtn: function () {
    $('.like-btn').click(function (e) {
      if ($(e).hasClass('liked')) {
        return;
      }
      const path = e.target.dataset.path
      const $e = $(e.target)
      $.ajax({
        type: "post",
        url: path,
        data: "{}",
        contentType: "application/json",
        dataType: "json",
        success: function (data) {
          $e.addClass('liked')
          // $(e).removeAttr('onclick');
          var count = $e.parent('div').find('.like-count')
          var likeCount = parseInt(count.html())
          $e.parent('div').find('.like-count').html(likeCount + 1);
          xueContext.likeBtn()
        },
        error: function (msg) {
          xueContext.likeBtn();
        }
      })
    });
    ``
  },

  moreBtn: function () {
    $('.more-btn').click(function (e) {
      const path = e.target.dataset.path
      var moreContainer = "#moreContainer";
      var moreLoading = '#pagination';
      $.ajax({
        type: "GET",
        url: path,
        beforeSend: function () {
          $(moreLoading).empty();
          $(moreLoading).addClass("loading");
        },
        success: function (data) {
          $(moreLoading).removeClass("loading");
          $(moreLoading).empty();
          let result = $(data).find(moreContainer);
          $(moreContainer).append(result.children());
          let page = "#pagination";
          let pagination = $(data).find(page);
          $(page).empty();
          $(page).append(pagination.children());
          // 多次点击
          xueContext.moreBtn();
          xueContext.reveal();
        },
        error: function () {
          xueContext.moreBtn()
        }
      });
    });
  },

  // 包裹图片 ,这个需要在 lazyloadImages 方法之前
  wrapImage: function () {
    const $imgs = $(
      "#lightGallery img:not([class])"
    );
    if (!$imgs.length) {
      return;
    }
    $imgs.each(function () {
      const $this = $(this);
      $this.addClass('lazyload')
      const src = $this.attr('src')
      $this.attr('data-src', src)
      $this.attr('src', loadingGif)
      $this.css('max-height', '500px')
      $this.wrap(
        $(
          `<span style="display: block;" data-fancybox="gallery" href="${src}"></span>`
        )
      );
    });
  },

  // 懒加载图片
  lazyloadImage: function () {
    const imgs = document.querySelectorAll('img.lazyload');
    const randomImgs = document.querySelectorAll('img.img-random');

    //用来判断bound.top<=clientHeight的函数，返回一个bool值
    function isIn(el) {
      const bound = el.getBoundingClientRect();
      const clientHeight = window.innerHeight;
      return bound.top <= clientHeight;
    }

    //检查图片是否在可视区内，如果不在，则加载
    function check() {
      Array.from(imgs).forEach(function (el) {
        if (isIn(el)) {
          loadImg(el);
        }
      })

      Array.from(randomImgs).forEach(function (el) {
        if (isIn(el)) {
          loadRandomImgs(el);
        }
      })
    }

    function loadImg(el) {
      const loaded = el.getAttribute('data-loaded')
      if (!loaded) {
        el.src = el.dataset.src;
        el.setAttribute('data-loaded', true)
      }
    }

    function loadRandomImgs(el) {
      const loaded = el.getAttribute('data-loaded')
      if (!loaded) {
        var index = el.getAttribute('index');
        var imgIndex = !index ? new Date().getSeconds() : index;
        if (el.classList.contains('img-random') && typeof photos !== 'undefined' && photos.length > 0) {
          el.src = photos[imgIndex % photos.length];
        }
        el.setAttribute('data-loaded', true)
      }
    }

    check();
    window.onload = window.onscroll = function () { //onscroll()在滚动条滚动的时候触发
      check();
    }
  },

  // 相册页面
  gallery: function () {
    const $photoPage = $(".photos-page");
    // 判断当前是否为图库界面
    if ($photoPage.length < 1) {
      return;
    }
    // 渲染图库信息
    const $masonrys = $(".masonry-gallery.gallery");

    const option = {
      masonry: {
        gutter: 10,
      },
      itemSelector: ".gallery-item",
    };
    $masonrys.find("img.lazyload").on('load', function () {
      $masonrys.isotope(option);
    })

    $("#gallery-filter li a").on("click", function () {
      $("#gallery-filter li a").removeClass("active");
      $(this).addClass("active");
      var dataFilter = $(this).data("filter");
      $masonrys.isotope({
        filter: dataFilter,
      });
      return false;
    });
  },

  // 高亮代码
  highlightCode: function () {
    document.querySelectorAll('pre code').forEach((el) => {
      // 在页面上显示这个代码块的语言
      var cls = el.getAttribute('class');
      if (cls !== undefined && cls !== null) {
        var langs = cls.split(' ');
        if (langs !== undefined && langs !== null) {
          el.setAttribute('data-language', langs[0].replace('language-', ''))
        }
      }
      hljs.highlightBlock(el);
    });

    // 设置代码行号
    xueContext.setCodeLineNumber();
  },

  // 设置代码行号
  setCodeLineNumber: function () {
    $('.md-content  pre>code[class*="language-"]').each(function (i, block) {
      lineNumbersBlock(block);
    });
  },

  // 处理置顶
  handleBack2Top: function () {
    function dealBack2Top() {
      if (document.body.clientWidth <= 800) {
        return;
      }
      if (xueContext.scrollTop() > 0) {
        $(".back-2-top").show();
      } else {
        $(".back-2-top").hide();
      }
    }

    document.addEventListener('scroll', dealBack2Top, false);

    document.querySelector('.back-2-top').addEventListener('click', function () {
      window.scroll({top: 0, behavior: 'smooth'});
    });
  },
};


!(function () {
  document.addEventListener("DOMContentLoaded", function () {
    Object.values(xueContext).forEach(f => f());
  });
})();