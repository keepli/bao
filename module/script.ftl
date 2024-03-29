<#if is_categories?? || is_tags ??>
    <#--标签云-->
<#--    <script src="${theme_base!}/source/js/jqcloud-1.0.4.min.js"></script>-->
    <script type='text/javascript'>
      $(function () {
        renderTagCloud();
        renderCategoryCloud();
      });
    </script>
</#if>

<script type="text/javascript">
  // console.clear();
  console.log("%c 有朋自远方来, 不亦说乎.", "background:#24272A; color:#ffffff", "");
  <#if settings.github??>
    console.log("%c Github %c", "background:#24272A; color:#ffffff", "", "${settings.github!}");
  </#if>
</script>

<script type="text/javascript">
  ${settings.common_js!''}

  const loading = "${theme_base!}/source/images/loading-45.svg";
  var photoList = `${settings.card_random_cover_list!''}`;
  var photos = new Array();
  if (photoList && photoList.trim() !== '') {
    if(photoList.endsWith(';')) {
      photoList = photoList.substring(0, photoList.length - 1);
    }
    var photoArr = photoList.split(";");
    // 过滤photos中的空字符
    for(let i = 0; i < photoArr.length; i++) {
        if (photoArr[i] && photoArr[i].trim().length > 0){
             photos.push(photoArr[i].trim());
        }

    }
  }
</script>

<#if settings.TimeStatistics??>
    <script type="text/javascript">
      // 建站时间统计
      function show_date_time() {
        if ($("#span_dt_dt").length > 0) {
          BirthDay = new Date("${settings.TimeStatistics!}");
          today = new Date();
          timeold = (today.getTime() - BirthDay.getTime());
          sectimeold = timeold / 1000;
          secondsold = Math.floor(sectimeold);
          msPerDay = 24 * 60 * 60 * 1000;
          e_daysold = timeold / msPerDay;
          daysold = Math.floor(e_daysold);
          e_hrsold = (e_daysold - daysold) * 24;
          hrsold = Math.floor(e_hrsold);
          e_minsold = (e_hrsold - hrsold) * 60;
          minsold = Math.floor((e_hrsold - hrsold) * 60);
          seconds = Math.floor((e_minsold - minsold) * 60);
          span_dt_dt.innerHTML = daysold + "天" + hrsold + "小时" + minsold + "分" + seconds + "秒";
        }
      }

      setInterval("show_date_time()","1000");
    </script>
</#if>


<#-- Pjax 相关代码 -->
<#include "pjax.ftl">
