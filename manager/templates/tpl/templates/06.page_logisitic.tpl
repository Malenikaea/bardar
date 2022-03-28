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


        <!-- Welcome Section 1 -->
        <div class="welcome-section-1 container-fluid no-padding">
            <div class="section-padding"></div>
            <div class="container">
                    
                {if $_modx->resource.about_1_title} 
                    <div class="section-header">
                        <h3>{$_modx->resource.about_1_title}</h3>
                        <h5>{$_modx->resource.about_1_subtitle}</h5>
                        <img src="uploads/section-seprator.png" alt="section-seprator" width="169" height="15">
                       {$_modx->resource.about_1_text}
                    </div><!-- Section Header /-  -->
                    <div class="col-md-7 col-sm-7 col-xs-6 wc-img-box">
                        {if $_modx->resource.about_1_image}
                            <img src="{$_modx->resource.about_1_image}" alt=""  />
                        {/if}
                    </div>
                {/if}

                <div class="col-md-5 col-sm-5 col-xs-6"> 
                    {if $_modx->resource.infoblocks} 
                        {foreach json_decode($_modx->resource.infoblocks) as $b}                            
                            <div class="mission-content">
                                <img src="uploads/{$b.image}" alt="{$b.title}" >
                                <h3>{$b.title}</h3>
                                <p>{$b.description}</p>
                            </div> 
                        {/foreach} 
                    {/if}
                </div>
            </div><!-- Container /- -->
            <div class="section-padding"></div>
        </div><!-- Welcome Section 1 /- --> 
    </main> 

{/block}