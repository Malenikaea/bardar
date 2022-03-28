{extends 'file:templates/page.tpl'}

<!-- ####################################################### -->

{block 'middle'}

    <main class="site-main page-spacing">

        <!-- Page Banner -->
        <div class="page-banner container-fluid no-padding">
            <div class="page-banner-content">
                <h3>{$_modx->resource.pagetitle}</h3>
            </div>
        </div><!-- Page Banner /- -->


        <!-- Gallery column 4 -->
		<div class="gallery-section gallery-column-3 gallery-column-4 container-fluid no-padding">
        <div class="section-padding"></div>
        <!-- Container -->
        <div class="container" id="pdopage">
            <ul class="portfolio-list no-left-padding rows"> 
                {$_modx->runSnippet('!pdoPage@page', [
                'limit' => 12,
                'tvname' => 'partners',
                'element' => 'getImageList', 
                'tpl' => 'partnersItem.tpl',
                'ajaxMode' => 'default',
                'processTVs' => 'image'
                ])}    
            </ul> 

            <nav class="ow-pagination"> 
                {$_modx->getPlaceholder('page.nav')}
            </nav>


            {if $_modx->resource.content} 
                <div class="section-padding"></div> 
                <div class="content">{$_modx->resource.content}</div> 
            {/if}


        </div><!-- Container / -->
        <div class="section-padding"></div>
    </div><!-- Gallery column 4 / -->
    

 
    

       
    </main> 

{/block}