<div class="pagination-list flex flex-row " id="pagination">
    <#if pagination.hasNext>
        <div class="sbtn diag-btn more-btn see-more" role="button" data-path="${pagination.nextPageFullPath!}">
            查看更多
        </div>
    <#else>
        <p style="color: #cccccc">~你已经到底了~</p>
    </#if>
</div>