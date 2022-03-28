{var $base = $_modx->config.site_url}
{var $site_name = $_modx->config.site_name}
{var $lang = $_modx->config.cultureKey}

{if ($_modx->resource.template not in list [2])}
    {var $bodyClass = ''}
    {var $headerClass = 'header-main header-position'}
{else}
    {var $bodyClass = ''}
    {var $headerClass = 'header-main'}
{/if}

<!DOCTYPE html>
<html lang="{$lang}">

<head>
    <meta charset="utf-8">
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no" />

    <base href="{$base}" />

    {'!SeoSuiteMeta'|snippet}


    <!-- Standard Favicon -->
    <link rel="icon" type="image/x-icon" href="assets/template/images/favicon.ico" />

    <!-- For iPhone 4 Retina display: -->
    <link rel="apple-touch-icon-precomposed" sizes="114x114"
        href="assets/template/images/apple-touch-icon-114x114-precomposed.png">

    <!-- For iPad: -->
    <link rel="apple-touch-icon-precomposed" sizes="72x72"
        href="assets/template/images/apple-touch-icon-72x72-precomposed.png">

    <!-- For iPhone: -->
    <link rel="apple-touch-icon-precomposed" href="assets/template/images/apple-touch-icon-57x57-precomposed.png">

    <!-- Custom - Theme CSS -->

    <link rel="stylesheet" href="{('assets/template/css/style.css')|version}">

    <!--[if lt IE 9]>
		<script src="assets/template/js/html5/respond.min.js"></script>
    <![endif]-->


</head>

<body class="{$bodyClass}" data-offset="200" data-spy="scroll" data-target=".ow-navigation">

    <!-- Loader -->
    <div id="site-loader" class="load-complete">
        <div class="loader">
            <div class="loader-inner ball-clip-rotate">
                <div></div>
            </div>
        </div>
    </div><!-- Loader /- -->

    {set $socials}
    {'pdoResources' | snippet: [
            'loadModels' => 'wmdsocials',
            'class' => 'wmdSocialsItem',
            'limit' => 0,
            'tpl' => '@FILE chunks/socials/item.tpl',
            'sortby' => 'position',
            'sortdir' => 'ASC',
            'where' => [
                'active' => 1
            ]
        ]}
    {/set}

    <!-- ####################################################### -->

    {block 'header'}

        {set $langs}
        <ul class="langs">
            {'BabelLinks' | snippet: [
                        'wrapperTpl' => 'tpl.babelWrapper',
                        'tpl' => 'tpl.babelRow',
                        'ignoreSiteStatus' => 1,
                        'showCurrent' => 1,
                        'includeUnlinked' => 1,
                    ]}
        </ul>
        {/set}

        <!-- Header -->
        <header class="{$headerClass} container-fluid no-padding">
            <!-- Navigation -->
            <div class="menu-block container-fluid no-padding">
                <!-- Container -->
                <div class="container">
                    <nav class="navbar ow-navigation">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                                data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="{$base}" title="{$site_name}">
                                {if $_modx->resource.template==2}
                                    <img src="assets/template/images/white-bardar.svg" alt="{$site_name}" />
                                {else}
                                    <img src="assets/template/images/black-bardar.svg" alt="{$site_name}" />
                                {/if}
                            </a>
                        </div>


                        <div class="add-to-cart">
                            {$langs}
                            <ul class="cart">
                                <li>
                                    <a href="{6|bb|url}#form-section" id="cart" class="btn">{"button.partner"|lexicon}</a>
                                </li>
                            </ul>
                        </div>


                        <div id="navbar" class="navbar-collapse collapse navbar-right">
                            {$_modx->runSnippet('!pdoMenu', [
                                    'parents' => 0,
                                    'level'=> 1,  
                                    'outerClass' => 'nav navbar-nav',
                                    'innerClass' => 'dropdown-menu',
                                    'tplParentRow' => '@FILE chunks/menu/parent.tpl'
                                ])}

                            {$langs}
                        </div>
                    </nav><!-- Navigation -->
                </div>
            </div><!-- Container /- -->
        </header><!-- Header /- -->

    {/block}


    <!-- ####################################################### -->


    {block 'middle'}

        {var $default_content = true}

        <!-- Проверяем ID ресурса -->
        {switch $_modx->resource.id}
        {case 7,22,33}
        {include 'file:templates/pages/contacts.tpl'}
        {var $default_content = false}
        {/switch}

        {if $default_content}
            {include 'file:templates/pages/content_default.tpl'}
        {/if}

    {/block}


    <!-- ####################################################### -->

    {block 'footer'}

        <footer class="footer-main container-fluid no-padding">
            <div class="footer-content container">
                <div class="col-md-4 col-sm-6 col-xs-6">
                    <div class="about-footer">
                        <img src="assets/template/images/white-bardar.svg" alt="{$site_name}" />
                        <p>{"footer.text"|lexicon}</p>

                        <a href="{7|bb|url}" class="about-links">{"link.contacts"|lexicon}</a>
                    </div>
                </div>

                <div class="col-md-4 col-sm-6 col-xs-6">
                    <div class="about-footer">
                        <h5>{"footer.partners_title"|lexicon}</h5>
                        <p>{"footer.partners_text"|lexicon}</p>

                        <a href="{1|bb|url}#become" class="about-links order" data-to="#form">{"button.partner"|lexicon}</a>
                    </div>
                </div>

                <div class="col-md-4 col-sm-6 col-xs-6">
                    <div class="about-footer">
                        <h5>{"footer.contacts_title"|lexicon}</h5>

                        <p>
                            {"address"|lexicon}
                            <br>{$_pls['+emailContact']}
                            {if $_pls['+phone']}
                                {set $phones = $_pls['+phone']|split}
                                {foreach $phones as $ph}
                                    <br><a href="tel:{$ph|phone}">{$ph}</a>
                                {/foreach}
                            {/if}
                        </p>

                        <ul>
                            {$socials}
                        </ul>

                    </div>
                </div>
            </div>
        </footer>

        <!-- Bottom Footer -->
        <div class="bottom-footer container-fluid no-padding">
            <div class="container">
                <div class="footer-copyright">
                    <p>&copy; Copyrights {''|date_format:'%Y'} All Rights Reserved</p>
                </div>
                <div class="footer-breadcrumb pull-right">

                    {$_modx->runSnippet('!pdoMenu', [
                            'parents' => 0,
                            'level'=> 1, 
                            'outerClass' => 'breadcrumb', 
                        ])}
                </div>
            </div>
        </div>
        <!-- Bottom Footer /- -->



    {/block}


    <div class="social-buttons-wrapper">
        {if $_pls['+telegram']}
            <a href="#" class="round-btn round-btn_telegram-btn" data-panel=".panel_telegram">
                <svg style="enable-background:new 0 0 512 512;" width="60" height="60" version="1.1" viewBox="0 0 512 512"
                    xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                    <style type="text/css">
                        .st0 {
                            display: none;
                            fill: #FEFEFE;
                        }

                        .st1 {
                            fill: #0087CB;
                        }

                        .st2 {
                            fill: #FCFDFE;
                        }

                        .st3 {
                            fill: #CCD9E9;
                        }

                        .st4 {
                            fill: #B1C8DB;
                        }
                    </style>
                    <g id="Layer_1" />
                    <g id="Layer_2">
                        <g>
                            <path class="st0"
                                d="M0.4,512.4c0-170.7,0-341.3,0-512c170.7,0,341.3,0,512,0c0,170.7,0,341.3,0,512    C341.8,512.4,171.1,512.4,0.4,512.4z" />
                            <path class="st1"
                                d="M254.6,76.5c49,0.3,90.8,16.4,125.7,49.3c34.8,32.9,53.8,73.7,56.1,121.6c2.4,51.2-14,96-49.5,133.1    c-34.9,36.5-78,55.3-128.6,55.8c-47.1,0.5-88.4-15.3-123-47.2C94.5,351.4,74.9,304.2,77,248.7c1.7-46.5,19.6-86.5,52.5-119.3    C164.2,94.7,206.6,77.4,254.6,76.5z" />
                            <path class="st2"
                                d="M201.4,280.7c-9.8-3-19.7-6.1-29.5-9.1c-4.8-1.5-9.6-3-14.4-4.5c-1.8-0.6-3.5-1.2-5-2.3    c-2.8-2.1-3-4.7-0.6-7.3c1.6-1.8,3.6-3,5.8-3.9c5.8-2.3,11.6-4.6,17.4-6.9c40-15.4,80-30.9,120.1-46.3c12.7-4.9,25.3-9.8,38-14.7    c1.7-0.7,3.5-1.1,5.4-0.8c3.8,0.6,6.7,3.7,7.1,7.7c0.2,2.2,0.1,4.4-0.3,6.6c-4.9,23-9.8,46.1-14.7,69.1c-4,19-8.1,38-12.1,57.1    c-0.9,4.3-1.8,8.6-2.7,12.9c-0.4,2.1-1,4.1-2,6c-2,3.7-5.2,5.1-9.3,4.3c-2.5-0.5-4.7-1.6-6.7-3.1c-13.8-10.2-27.6-20.5-41.5-30.7    c-0.6-0.5-1.3-0.9-1.9-1.3c-2.4-0.7-4.1-2.5-6-3.9c-6.6-4.8-13.2-9.8-19.8-14.6c-0.5-0.4-1-0.8-1.4-1.3c-0.6-1,0-1.6,0.6-2.2    c9-8,17.9-16.2,26.9-24.2c6.5-5.9,13.1-11.8,19.6-17.7c6.5-5.9,13-11.7,19.5-17.5c5.1-4.6,10.2-9.1,15.2-13.7    c0.4-0.4,0.8-0.8,1.2-1.2c0.3-0.4,0.7-0.8,0.5-1.3c-0.2-0.6-0.8-0.6-1.3-0.6c-1.8-0.2-3.3,0.5-4.8,1.4    c-5.5,3.3-10.8,6.8-16.2,10.2c-16.4,10.3-32.9,20.7-49.3,31c-11.3,7.1-22.6,14.2-33.9,21.4C204,280,203.1,281.3,201.4,280.7z" />
                            <path class="st3"
                                d="M201.4,280.7c2.7-1.1,5-2.9,7.5-4.4c7.2-4.5,14.4-9,21.6-13.6c5.1-3.2,10.1-6.5,15.2-9.7    c8.4-5.3,16.9-10.6,25.4-15.9c5.9-3.7,11.8-7.5,17.8-11.3c5.2-3.3,10.4-6.6,15.6-9.9c1.7-1,3.4-1.6,5.5-1.4    c0.6,0.1,1.2,0.1,1.4,0.7c0.3,0.6,0.1,1.2-0.4,1.8c-1.2,1.2-2.3,2.5-3.7,3.6c-2.5,2-4.7,4.3-7.1,6.4c-3.9,3.3-7.5,6.9-11.4,10.2    c-1.6,1.4-3.1,2.9-4.7,4.3c-2.3,1.9-4.5,4.2-6.7,6.2c-3.4,3.1-6.9,6.1-10.3,9.1c-1.5,1.4-3.1,2.8-4.5,4.2    c-3.7,3.5-7.6,6.8-11.3,10.3c-4.5,4.1-9.1,8.1-13.5,12.3c-3.2,3-6.6,5.8-9.9,8.7c-0.5,0.4-0.5,0.8-0.2,1.3    c-0.7,11.3-1.5,22.6-2.2,33.9c-0.2,3-0.6,5.9-0.5,8.9c0,0.9,0,1.7-0.7,2.4c-0.6,0.2-1.3,0.2-1.9,0.2c-1.8-0.1-3.1-1-3.6-2.7    c-0.5-1.8-1.1-3.5-1.6-5.3c-4.9-16.1-9.8-32.3-14.7-48.4C202,281.9,201.7,281.3,201.4,280.7z" />
                            <path class="st4"
                                d="M224,338.7c-0.3-3.9,0.4-7.8,0.5-11.6c0.2-4.2,0.6-8.4,0.8-12.6c0.3-4.3,0.6-8.6,0.9-12.8    c0.1-2.2,0.3-4.4,0.3-6.5c0-0.7,0.2-1.2,0.9-1.6c8.1,6,16.2,11.9,24.2,17.9c0.9,0.7,1.9,1.2,2.6,2.1c-7.5,7.3-15.1,14.6-22.6,21.9    C229.6,337.5,227.2,339.1,224,338.7z" />
                        </g>
                    </g>
                </svg>
            </a>
        {/if}

        {if $_pls['+viber']}
            <a href="#" class="round-btn round-btn_viber-btn" data-panel=".panel_viber">
                <svg xmlns="http://www.w3.org/2000/svg" class="round-btn__icon" width="28.44" height="30"
                    viewBox="0 0 28.44 30">
                    <path style="fill:#fff;"
                        d="M28,8.15a9.78,9.78,0,0,0-2.76-5.23,10.38,10.38,0,0,0-3-1.7A22.82,22.82,0,0,0,14.74,0H13.45a18.7,18.7,0,0,0-3.1.24,19.07,19.07,0,0,0-3.87.87A10.41,10.41,0,0,0,3,3.1,9,9,0,0,0,.74,7,20.22,20.22,0,0,0,0,12.3,22.76,22.76,0,0,0,.21,17a12.19,12.19,0,0,0,1.7,5,8.48,8.48,0,0,0,5,3.4v3.4a3,3,0,0,0,.2.68.84.84,0,0,0,.5.44,1.23,1.23,0,0,0,1.11-.18,7.93,7.93,0,0,0,.94-.94l.47-.52,1.75-1.94a28.92,28.92,0,0,0,6.1-.17,14.93,14.93,0,0,0,2.82-.53l.35-.06a10,10,0,0,0,3.81-1.75,9.54,9.54,0,0,0,3.22-6.5A28.51,28.51,0,0,0,28,8.15ZM18.14,21.21A16.25,16.25,0,0,1,15.39,20a24.14,24.14,0,0,1-3.29-2.1,15.06,15.06,0,0,1-2.46-2.46,24.46,24.46,0,0,1-1.75-2.66A18.18,18.18,0,0,1,6.65,10.2L6.3,9.44a2.14,2.14,0,0,1,.41-1.77A5.86,5.86,0,0,1,8.3,6.39a1.06,1.06,0,0,1,1.4.23l1.05,1.29a16.57,16.57,0,0,1,.89,1.4,1.43,1.43,0,0,1,.14.91,1.08,1.08,0,0,1-.38.68l-.7.52a.81.81,0,0,0-.3.53v.3l.24.64a7.51,7.51,0,0,0,.76,1.46A6.22,6.22,0,0,0,12.93,16a6,6,0,0,0,2.4,1.22l.28-.06a.84.84,0,0,0,.54-.29l.59-.7a1,1,0,0,1,.66-.38,1.06,1.06,0,0,1,.85.21A12.6,12.6,0,0,1,21,17.87a1.07,1.07,0,0,1,.24,1.4A5.16,5.16,0,0,1,19.9,20.8,1.84,1.84,0,0,1,18.14,21.21ZM14.63,8.09q-.36,0-.33-.39c0-.25.15-.38.39-.38A5.53,5.53,0,0,1,18.53,9a5.21,5.21,0,0,1,1.31,3.75c0,.24-.13.35-.38.35s-.38-.13-.38-.41A4.36,4.36,0,0,0,18,9.55,4.79,4.79,0,0,0,14.63,8.09Zm3.27,4c0,.28-.12.4-.37.4s-.39-.11-.39-.35a1.86,1.86,0,0,0-1.93-2c-.23,0-.35-.13-.32-.39a.35.35,0,0,1,.37-.38A2.49,2.49,0,0,1,17.9,12.07Zm3.55,1.82c-.25,0-.39-.12-.39-.35A7.37,7.37,0,0,0,19,8,6.76,6.76,0,0,0,14,6.15c-.28,0-.41-.13-.41-.38s.13-.38.41-.38a7.47,7.47,0,0,1,5.51,2.17,8,8,0,0,1,2.28,6C21.83,13.77,21.7,13.89,21.45,13.89Z">
                    </path>
                </svg>
            </a>
        {/if}

        {if $_pls['+wtsp']}
            <a href="#" class="round-btn round-btn_wtsp-btn" data-panel=".panel_wtsp">
                <svg height="60px" version="1.1" viewBox="0 0 60 60" width="60px" xmlns="http://www.w3.org/2000/svg"
                    xmlns:xlink="http://www.w3.org/1999/xlink">
                    <g fill="none" fill-rule="evenodd" id="flat" stroke="none" stroke-width="1">
                        <g id="whatsapp">
                            <path
                                d="M30,60 C46.5685433,60 60,46.5685433 60,30 C60,13.4314567 46.5685433,0 30,0 C13.4314567,0 0,13.4314567 0,30 C0,46.5685433 13.4314567,60 30,60 Z"
                                fill="#57BB63" />
                            <path
                                d="M30.0712615,46.2210462 C27.2108308,46.2210462 24.5235692,45.4899692 22.1856,44.2068923 L13.1538462,47.0769231 L16.0980923,38.3918769 C14.6130462,35.9523692 13.7575385,33.0915692 13.7575385,30.0336 C13.7575385,21.0934154 21.0612923,13.8461538 30.0716308,13.8461538 C39.0808615,13.8461538 46.3846154,21.0934154 46.3846154,30.0336 C46.3846154,38.9737846 39.0812308,46.2210462 30.0712615,46.2210462 Z M30.0712615,16.4241231 C22.5079385,16.4241231 16.3558154,22.5293538 16.3558154,30.0336 C16.3558154,33.0114462 17.3265231,35.7692308 18.9681231,38.0130462 L17.2548923,43.0670769 L22.5252923,41.3918769 C24.6912,42.8137846 27.2854154,43.6430769 30.0712615,43.6430769 C37.6334769,43.6430769 43.7867077,37.5382154 43.7867077,30.0339692 C43.7867077,22.5297231 37.6334769,16.4241231 30.0712615,16.4241231 L30.0712615,16.4241231 Z M38.3088,33.7617231 C38.2083692,33.5966769 37.9417846,33.4969846 37.5426462,33.2987077 C37.1424,33.1004308 35.1758769,32.1400615 34.8099692,32.0082462 C34.4429538,31.8760615 34.176,31.8092308 33.9097846,32.2065231 C33.6435692,32.6038154 32.8770462,33.4969846 32.6433231,33.7617231 C32.4099692,34.0268308 32.1769846,34.0600615 31.7771077,33.8614154 C31.3776,33.6631385 30.0889846,33.2440615 28.5611077,31.8923077 C27.3725538,30.8407385 26.5698462,29.5425231 26.3368615,29.1448615 C26.1035077,28.7479385 26.3121231,28.5334154 26.5122462,28.3358769 C26.6920615,28.1579077 26.9121231,27.8724923 27.1122462,27.6409846 C27.3123692,27.4091077 27.3788308,27.2440615 27.5117538,26.9789538 C27.6454154,26.7142154 27.5785846,26.4827077 27.4785231,26.2836923 C27.3784615,26.0854154 26.5783385,24.1329231 26.2452923,23.3383385 C25.9122462,22.5444923 25.5795692,22.6766769 25.3458462,22.6766769 C25.1124923,22.6766769 24.8459077,22.6434462 24.5793231,22.6434462 C24.3127385,22.6434462 23.8792615,22.7427692 23.5126154,23.1396923 C23.1463385,23.5369846 22.1136,24.4969846 22.1136,26.4491077 C22.1136,28.4016 23.5458462,30.288 23.7463385,30.5523692 C23.9460923,30.8167385 26.5118769,34.9536 30.5767385,36.5424 C34.6430769,38.1308308 34.6430769,37.6009846 35.3763692,37.5348923 C36.1085538,37.4688 37.7412923,36.5752615 38.0754462,35.6488615 C38.4081231,34.7217231 38.4081231,33.9271385 38.3088,33.7617231 L38.3088,33.7617231 Z"
                                fill="#FFFFFF" />
                        </g>
                    </g>
                </svg>
            </a>
        {/if}
    </div>


    <div class="overlayp panel_telegram">
        <span class="close_panel"></span>
        <div class="panel_info">
            <img src="assets/template/images/social/telegram_icon.png" alt=""><br>
            <div class="sc-title">{'sc_telegram_title'|lexicon}</div>
            <a href="https://t.me/{$_pls['+telegram']|replace: '+': ''}">{$_pls['+telegram']}</a>
            <p>{'sc_desc'|lexicon}</p>
        </div>
    </div>

    <div class="overlayp panel_viber">
        <span class="close_panel"></span>
        <div class="panel_info">
            <img src="assets/template/images/social/viber_icon.png" alt="Viber"><br>
            <div class="sc-title">{'sc_viber_title'|lexicon}</div>
            <a href="viber://chat?number={$_pls['+viber']|replace: '+': '%2B'}">{$_pls['+viber']}</a>
            <div>{'sc_desc'|lexicon}</div>
        </div>
    </div>

    <div class="overlayp panel_wtsp">
        <span class="close_panel"></span>
        <div class="panel_info">
            <img src="assets/template/images/social/wtsp_icon.png" alt="WhatsApp"><br>
            <div class="sc-title">{'sc_wtsp_title'|lexicon}</div>
            <a href="https://api.whatsapp.com/send?phone={$_pls['+wtsp']|replace: '+': ''}">{$_pls['+wtsp']}</a>
            <div>{'sc_desc'|lexicon}</div>
        </div>
    </div>


    <!-- ####################################################### -->

    {block 'scripts'}

        <!-- JQuery v1.11.3 -->
        <script src="assets/template/js/jquery.min.js"></script>

        <!-- Library - Js -->
        <script src="assets/template/libraries/lib.js"></script><!-- Bootstrap JS File v3.3.5 -->

        <!-- Library - Google Map API -->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDW40y4kdsjsz714OVTvrw7woVCpD8EbLE"></script>

        <!-- Library - Theme JS -->
        <script src="assets/template/js/functions.js"></script>
    {/block}


</body>

</html>