<main class="site-main page-spacing">
	
    <!-- Page Banner -->
    <div class="page-banner container-fluid no-padding">
        <div class="page-banner-content">
            <h3>{$_modx->resource.pagetitle}</h3>
        </div>
    </div><!-- Page Banner /- -->

    <!-- Contact Us 1 -->
    <div class="contact-us-1 container-fluid no-padding">
        <div class="section-padding"></div>
        <!-- Container -->
        <div class="container">
            <div class="col-md-6 col-sm-6 col-xs-6">
                <!-- Section Header -->
                <div class="section-header left-header">
                    <h3>{$_modx->resource.pagetitle}</h3> 
                    <img src="uploads/section-seprator-1.png" alt="section-seprator-1" width="70" height="3">
                    <br>
                    {$_modx->resource.introtext}
                </div><!-- Section Header /- -->

                
                {'!AjaxForm' | snippet: [
                    'snippet' => 'FormIt',
                    'hooks' => 'rcv3,email,FormItSaveForm',
                    'form' => '@FILE chunks/form/contactForm.tpl',
                    'emailTpl' => '@FILE chunks/form/Email.tpl',
                    'emailTo' => $_modx->config.emailTo,
                    'emailFrom' => $_modx->config.emailsender, 
                    'emailSubject' => 'Форма: Контакты',
                    'successMessage' => 'form.success'|lexicon,
                    'validate' => '
                        firstname:required,  
                        email:required,
                        phone:required, 
                        company:required, 
                        email2:blank',
                    'formName' => 'Контакты',
                    'formFields' => 'firstname,company,country,email,phone,message',
                    'fieldNames' => 'firstname==Имя,company==Компания,country==Город,phone==Телефон,email==Email,message==Сообщение'
                ]}

               
            </div>
            
            <div class="col-md-6 col-sm-6 col-xs-6 contact-detail">
                <div class="col-md-6 col-sm-6 col-xs-6 contact-content">
                    <div class="contact-info">
                        <h3>{"address.title"|lexicon}</h3>
                        <p>{"address"|lexicon}</p>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-6 contact-content">
                    <div class="contact-info">
                        <h3>{"title.contacts"|lexicon}</h3>
                        {if $_pls['+phone']}
                            {set $phones = $_pls['+phone']|split}
                            {foreach $phones as $ph}
                            <p><a href="tel:{$ph|phone}" >{$ph}</a></p>
                            {/foreach} 
                        {/if} 
                        <p><a href="{$_pls['+emailContact']}" title="{$_pls['+emailContact']}">{$_pls['+emailContact']}</a></p> 
                    </div>
                </div>
                <!-- Map Section -->
                <div class="map">
                    {$_pls['+map']}
                </div><!--  Map Section /- -->
            </div>
        </div><!-- Container /- -->
        <div class="section-padding"></div>
    </div><!-- Contact Us 1 /- -->

</main> 