 <#-- 使用樱花主题的评论模块：需要在后台系统模块找到评论设置修改评论的js文件 -->
 <#-- https://cdn.jsdelivr.net/gh/LIlGG/halo-comment-sakura/dist/halo-comment.min.js -->
<#macro comment target,type>
	<script>
	var configs = {
    	autoLoad: ${settings.autoLoad!},
    	showUserAgent: ${settings.showUserAgent!},
        loadingStyle: "balls"
	}
	</script>
	<#if !target.disallowComment!false>
		<section id="comments" class="comments">
          <#-- 在樱花主题的评论模块中没有在当前页面引入以下两个script脚本文件，需要手动引入 -->
          <script src="https://cdn.jsdelivr.net/npm/vue@2.6.10/dist/vue.min.js"></script>
          <#-- 这是通过修改的settings.ymal文件新增评论模块来获取的 -->
          <script src="${settings.comment_mode!'//cdn.jsdelivr.net/gh/LIlGG/halo-comment-sakura@v1.3.1/dist/halo-comment.min.js'}" defer></script>
			<div class="comments-main">
				<h3 id="comments-list-title">Comments | <span class="noticom">${target.commentCount!0} 条评论 </span></h3>
				<halo-comment id="${target.id?c}" type="${type}" :configs="configs"/>
			</div>
		</section>
	</#if>
 </#macro>  
  
  
  
  <#-- 以下是原本的评论模块：注意要在后台系统模块找到评论设置修改评论的js文件为默认，为空保存会自动填入默认值 -->
  <#--
  <#macro comment post,type>
    <#if !post.disallowComment!false>
        <script src="https://cdn.jsdelivr.net/npm/vue@2.6.10/dist/vue.min.js"></script>
        <script src="${options.comment_internal_plugin_js!'//cdn.jsdelivr.net/gh/halo-dev/halo-comment@latest/dist/halo-comment.min.js'}"></script>
        <halo-comment id="${post.id}" type="${type}"/>
    </#if>
</#macro>
      -->
