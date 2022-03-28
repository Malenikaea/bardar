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
    
    <!-- Welcome Section --> 
    {include "file:blocks/welcome.tpl"}


    {'!AjaxForm' | snippet: [
        'snippet' => 'FormIt',
        'hooks' => 'rcv3,email,FormItSaveForm',
        'form' => '@FILE chunks/form/catalogForm.tpl',
        'emailTpl' => '@FILE chunks/form/Email.tpl',
        'emailTo' => $_modx->config.emailTo,
        'emailFrom' => $_modx->config.emailsender, 
        'emailSubject' => 'Форма: Стать партнером',
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
    

    <!-- Menu Section -->
    <div class="menu-section container-fluid no-padding">
        <div class="section-padding"></div>
        <div class="container">
            <div class="section-header">
                <h3>{'menu.title'|lexicon}</h3>
                <h5>{'menu.subtitle'|lexicon}</h5>
                <img src="uploads/section-seprator.png" alt="section-seprator" width="169" height="15">
                <p>{'menu.description'|lexicon}</p>
            </div><!-- Section Header /-  -->
        </div><!-- Container /- -->

        <div  id="pdopage">
            <div class="rows"> 
                {$_modx->runSnippet('!pdoPage@page', [
                    'limit' => 12,
                    'element' => 'msProducts', 
                    'tpl' => '@FILE chunks/catalog/product.tpl', 
                    'sortby' => '{ "publishedon":"DESC" }',
                    'ajax' => 1,
                    'ajaxMode' => 'default', 
                ])} 
            </div>
    
            {$_modx->getPlaceholder('page.nav')}
             
        </div>

        <div class="text-center">
            <a href="{$_modx->resource.catalogfile}" class="btn-red" target="_blank">{"download"|lexicon}</a> 
         </div>

            
    </div><!-- Menu Section /- -->
    <div class="section-padding"></div>
    

</main> 

{/block}