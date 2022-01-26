<#include "module/macro.ftl">
<@layout title="${sheet.title!'友情链接'} | ${options.blog_title!}">
  <main class="mx-auto" id="container">
    <header class="bg-cover post-cover">
        <#if settings.links_placeholder?? && settings.links_placeholder!=''>
          <div class="cover-bg">
            <img src="${settings.links_placeholder!}" class="z-auto"
                 alt="${sheet.title!'友情链接'}">
          </div>
        <#else>
          <div class="placeholder-bg">
          </div>
        </#if>
      <div class="cover-content flex justify-center">
        <!-- 封面内容 -->
        <div class="inner flex flex-col justify-center">
          <p class="cover-title text-base md:text-4xl lg:text-4xl xl:text-5xl">${sheet.title!'友情链接'}</p>
        </div>
      </div>
    </header>
    <div
      class="container mx-auto px-4 mt-16 max-w-6xl tracking-wider md:leading-relaxed sm:leading-normal ct-container cn-pd content-container">
        <@linkTag method="listTeams">
            <#list teams as item>
                <#if item.team?? && item.team!=''>
                  <h3 class="w-full m-4">${item.team}</h3>
                </#if>
              <div class="flex flex-row flex-wrap grid lg:grid-cols-3 md:grid-cols-2 sm:grid-cols-1">
                  <#list item.links?sort_by('priority')?reverse  as link>
                    <a class="lk-card-im card-item-vel block" href="${link.url}" target="_blank"
                       onfocus="this.blur();">
                      <div class="media">
                        <div class="media-left">
                          <figure class="image is-64x64">
                              <#if link.logo?? && link.logo != ''>
                                <img src="${link.logo}" alt="${link.name}">
                              <#elseif settings.links_placeholder?? && settings.links_placeholder != ''>
                                <img src="${settings.links_placeholder}"
                                     alt="${link.name}">
                              <#else>
                                <img src="https://cdn.jsdelivr.net/gh/xzzai/static@v1.0.1/placeholder.jpg"
                                     alt="${link.name}">
                              </#if>
                          </figure>
                        </div>
                        <div class="media-content">
                          <p class="lk-title">${link.name}</p>
                          <p class="lk-desc">${link.description}</p>
                        </div>
                      </div>
                    </a>
                  </#list>
              </div>
            </#list>
          <div id="write">
            <!--声明区域-->
              ${sheet.formatContent!}
          </div>
        </@linkTag>
    </div>

    <div
      class="container mx-auto px-4 mt-16 max-w-6xl tracking-wider md:leading-relaxed sm:leading-normal ct-container cn-pd">
        <#include "module/comment.ftl">
        <@comment sheet,"sheet" />
    </div>
  </main>
</@layout>
