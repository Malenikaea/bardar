{if 1|bb|resource:"welcome_title"} 
    <!-- Welcome Section -->
    <div class="welcome-section container-fluid no-padding">
        <div class="section-padding"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-6">
                    <img src="uploads/welcome.png" alt="welcome" width="457" height="700" />
                </div>
                <div class="col-md-6 col-sm-6 col-xs-6 wc-content-box">
                    <div class="welcome-header">
                        
                    </div>
                    <div class="welcome-content">
                        <div class="section-header left-header">
                            <h3>{1|bb|resource:"welcome_title"}</h3> 
                            <img src="uploads/section-seprator-1.png" alt="section-seprator" width="70" height="3">
                            {1|bb|resource:"welcome_text"}
                            {if $_modx->resource.template==2}
                            <a href="{6|bb|url}" title="Read More" class="read-more">{"more"|lexicon}</a>
                            {/if}
                        </div><!-- Section Header /-  -->
                    </div>
                </div>
            </div>
        </div><!-- Container /- -->
    </div><!-- Welcome Section /- -->
{/if}