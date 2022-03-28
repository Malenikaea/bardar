{if 5|bb|resource:"team"}

    {set $team = json_decode(5|bb|resource:"team")}

    <!-- Team Section -->
    <div class="team-section container-fluid no-padding">
        <div class="section-padding"></div>
        <div class="container">
            <div class="row">
                <!-- Main Carousel -->
                <div id="main-carousel1" class="carousel slide carousel-fade" data-ride="carousel">
                    <div role="listbox" class="carousel-inner">

                        {foreach $team as $t}
                            <div class="item {if $t@first}active{/if}">
                                <div class="team-content">
                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <img src="uploads/{$t.image}" alt="{$t.title}" />
                                    </div>
                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <div class="section-header left-header">
                                            <h3>{$t.title}</h3>
                                            <h5>{$t.post}</h5>
                                            <img src="uploads/section-seprator-1.png" alt="section-seprator" width="70"
                                                height="3">
                                            {$t.description}
                                        </div><!-- Section Header /-  -->
                                    </div>
                                </div>
                            </div>
                        {/foreach}

                    </div>
                    <a class="left carousel-control" href="#main-carousel1" role="button" data-slide="prev">
                        <i class="fa fa-caret-right" aria-hidden="true"></i>
                    </a>
                    <a class="right carousel-control" href="#main-carousel1" role="button" data-slide="next">
                        <i class="fa fa-caret-left" aria-hidden="true"></i>
                    </a>
                </div><!-- Main Carousel /-  -->
            </div>
        </div><!-- Container /- -->
    </div><!-- Team Section /- -->
{/if}