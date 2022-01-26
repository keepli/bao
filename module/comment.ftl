<#macro comment post,type>
    <#if !post.disallowComment!false>
        <script src="https://cdn.jsdelivr.net/npm/vue@2.6.10/dist/vue.min.js"></script>
        <script src="${options.comment_internal_plugin_js!'//cdn.jsdelivr.net/gh/halo-dev/halo-comment@latest/dist/halo-comment.min.js'}"></script>
        <halo-comment id="${post.id}" type="${type}"/>
    </#if>
</#macro>
 <#-- 使用樱花主题的评论模块：需要在后台系统模块找到评论设置修改评论的js文件 -->
 <#-- https://cdn.jsdelivr.net/gh/LIlGG/halo-comment-sakura/dist/halo-comment.min.js -->
