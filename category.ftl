<#include "module/macro.ftl">
<@layout title="分类：${category.name} | ${options.blog_title!} ">
  <main class="mx-auto" id="container">
      <#if settings.card_random_cover_list?? && settings.card_random_cover_list != ''>
          <#assign x = "${settings.card_random_cover_list}"?trim />
          <#assign thumbnails = x?trim?split(";") />
          <#assign thumbnailSize = thumbnails?size />
          <#if settings.card_random_cover_list?ends_with(";")>
              <#assign thumbnailSize =thumbnailSize - 1 />
          </#if>
      </#if>
    <header class="bg-cover post-cover">
        <#assign categories_patternimg="${category.thumbnail!}" />

        <#if !(categories_patternimg?? && categories_patternimg!='')>
            <#assign categories_patternimg="${settings.categories_patternimg}" />
        </#if>

        <#if categories_patternimg?? && categories_patternimg!=''>
          <div class="cover-bg">
            <img src="${categories_patternimg!}" class="z-auto"
                 alt="${category.name}">
          </div>
        <#else>
          <div class="placeholder-bg">
          </div>
        </#if>
      <div class="cover-content flex justify-center">
        <!-- 封面内容 -->
        <div class="inner flex flex-col justify-center">
          <p class="cover-title text-base md:text-4xl lg:text-4xl xl:text-5xl">${category.name}</p>
        </div>
      </div>
    </header>
    <div class="container mx-auto px-4 content-container <#if !(settings.posts_style!true)>mx-850</#if>">
        <#if settings.posts_style!true>
            <#include "module/widget/post_cards.ftl">
        <#else>
            <#include "module/widget/post_list.ftl">
        </#if>
        <#-- 分页-->
        <#if posts.totalPages gt 1>
          <nav class="pagination flex flex-row justify-center mt-8" role="navigation" aria-label="pagination">
              <@paginationTag method="categoryPosts" page="${posts.number}" total="${posts.totalPages}" display="3" slug="${category.slug!}">                         <#include "module/widget/pagination.ftl">
              </@paginationTag>
          </nav>
        </#if>
    </div>
  </main>
</@layout>
