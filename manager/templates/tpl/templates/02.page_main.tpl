{extends 'file:templates/page.tpl'}

<!-- ####################################################### -->

{block 'middle'}

    <main class="site-main page-spacing">

        {if $_modx->resource.slider}

            <!-- Photo Slider -->
            <div class="photo-slider container-fluid no-padding">
                <!-- Main Carousel -->
                <div id="main-carousel" class="carousel slide carousel-fade" data-ride="carousel">
                    <div role="listbox" class="carousel-inner">

                        {foreach json_decode($_modx->resource.slider) as $s}
                            <div class="item {if $s@first}active{/if}">
                                <img alt="slider" src="uploads/{$s.bg}">
                                <div class="carousel-caption">
                                    <img data-animation="animated pulse" src="uploads/{$s.image}" alt="slider-ic">
                                    {if $s.title1}
                                        <p data-animation="animated bounceInLeft">{$s.title1}</p>
                                    {/if}
                                    {if $s.title2}
                                        <p data-animation="animated bounceInRight">{$s.title2}</p>
                                    {/if}
                                    {if $s.button_caption && $s.link}
                                        <a title="Read More" href="{$s.link}"
                                            data-animation="animated bounceInUp">{$s.button_caption}</a>
                                    {/if}
                                </div>
                            </div>
                        {/foreach}

                        <a class="left carousel-control" href="#main-carousel" role="button" data-slide="prev">
                            <i class="fa fa-caret-left" aria-hidden="true"></i>
                        </a>
                        <a class="right carousel-control" href="#main-carousel" role="button" data-slide="next">
                            <i class="fa fa-caret-right" aria-hidden="true"></i>
                        </a>
                    </div>
                </div><!-- Main Carousel /-  -->
            </div><!-- Photo Slider /- -->

        {/if}



        {include "file:blocks/welcome.tpl"}



        {if $_modx->resource.main_cats}

            {set $cats = json_decode($_modx->resource.main_cats)}

            <!-- Festival Section -->
            <div class="festival-section container-fluid no-padding">
                <div class="section-padding"></div>
                <div class="container">
                    <div class="festival-details-tab">

                        <!-- Tab panes -->
                        <div class="tab-content">
                            {foreach $cats as $t}
                                <div role="tabpanel" class="tab-pane {if $t@first}active{/if}" id="{$t.MIGX_id}">
                                    <div class="festival-content">
                                        <h5>{$t.title_txt}</h5>
                                        <img src="uploads/section-seprator-1.png" alt="section-seprator-1" width="70" height="3" />
                                        {$t.text} 
                                        <a href="{6|bb|resource:'catalogfile'}" title="{"more"|lexicon}" class="read-more"
                                                target="_blank">{"more"|lexicon}</a> 
                                    </div>
                                </div>
                            {/foreach}
                        </div>
                        <!-- Nav tabs -->

                        <ul class="nav nav-tabs" role="tablist">
                            {foreach $cats as $t}
                                <li role="presentation" class="{if $t@first}active{/if}">
                                    <a href="#{$t.MIGX_id}" aria-controls="{$t.MIGX_id}" role="tab" data-toggle="tab">
                                        <i><img src="uploads/{$t.tab_icon}" alt="festival-ic-1" width="37"
                                                height="42" /></i>{$t.tab_title}
                                    </a>
                                </li>
                            {/foreach}
                        </ul>

                    </div>
                </div><!-- Container /- -->
            </div><!-- Festival Section /- -->


        {/if}




        <!-- Menu Section -->
        <div id="menu-section" class="menu-section container-fluid no-padding">
            <div class="section-padding"></div>
            <div class="container">
                <div class="section-header">
                    
                <h3>{'menu.title'|lexicon}</h3>
                <h5>{'menu.subtitle'|lexicon}</h5>
                <img src="uploads/section-seprator.png" alt="section-seprator" width="169" height="15">
                <p>{'menu.description'|lexicon}</p>
                </div><!-- Section Header /-  -->
            </div><!-- Container /- -->

            {$_modx->runSnippet('!msProducts', [
                'parents' => 6|bb,
                'limit' => 12,
                'tpl' => '@FILE chunks/catalog/product.tpl', 
                'sortby' => '{ "publishedon":"DESC" }'
            ])}


                

            <div class="text-center">
                <a href="{6|bb|resource:'catalogfile'}" class="btn-red" target="_blank">{"download"|lexicon}</a> 
            </div>

        
             
        </div><!-- Menu Section /- -->
        <div class="section-padding"></div>


        {include "file:blocks/team.tpl"}
 

        <!-- Order Section -->
        <div class="order-section container-fluid no-padding" id="become">
            <div class="section-padding"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-7 col-sm-7 col-xs-7">
                        <div class="section-header"> 
                            <h3>{'main.form.title'|lexicon}</h3>
                            <h5>{'main.form.subtitle'|lexicon}</h5>
                            <img src="uploads/section-seprator.png" alt="section-seprator" width="169" height="15">
                            <br>
                            <p>{'main.form.description'|lexicon}</p>
                        </div><!-- Section Header /-  -->

                        {'!AjaxForm' | snippet: [
                            'snippet' => 'FormIt',
                            'hooks' => 'rcv3,email,FormItSaveForm',
                            'form' => '@FILE chunks/form/connectForm.tpl',
                            'emailTpl' => '@FILE chunks/form/Email.tpl',
                            'emailTo' => $_modx->config.emailTo,
                            'emailFrom' => $_modx->config.emailsender, 
                            'emailSubject' => 'Форма: Стать партнером - главная',
                            'successMessage' => 'form.success'|lexicon,                            
                            'validate' => '
                                firstname:required,  
                                address:required,
                                phone:required,  
                                email2:blank',
                            'formName' => 'Стать партнером',
                            'formFields' => 'firstname,address,type,phone',
                            'fieldNames' => 'firstname==Имя,address==Адрес,type==Тип,phone==Телефон'
                        ]}

                       
                    </div>
                </div>
            </div><!-- Container /- -->

            <div class="right-image">
                <img src="assets/template/images/order-online.png" alt="order-online" width="600" height="830" />
            </div>
            <div class="section-padding"></div>
        </div><!-- Order Section /- -->



        {if $_modx->resource.statistic}

            <!-- Counter Section -->
            <div class="counter-section container-fluid no-padding">
                <div class="container">

                    {foreach json_decode($_modx->resource.statistic) as $s}
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="counter-box">
                                <h3><span class="count" id="statistics_count-{$s.MIGX_id}" data-statistics_percent="{$s.num}"> &nbsp;</span></h3>
                                {$s.icon}
                                <p>{$s.title}</p>
                            </div>
                        </div> 
                    {/foreach}
                    
                </div>
            </div><!-- Counter Section /- -->

        {/if}

    </main>

{/block}