{extends 'file:templates/page.tpl'}

<!-- ####################################################### -->

{block 'middle'}
    <div class="main-content">

        <section class="section">
            <div class="empty-lg-110 empty-md-80 empty-sm-40 empty-xs-30"></div>
            <div class="empty-lg-110 empty-md-60 empty-sm-40 empty-xs-20"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="color-type-2 text-center">
                            <h5 class="h2 color-2">{$_modx->resource.pagetitle}</h5>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6 col-md-5 col-xs-12">
                        <div class="empty-sm-55 empty-xs-30"></div>
                        <div class="swipers-wrapper">
                            <div class="sideBarTopSwiper">
                                <div class="swiperMainWrapper">
                                    <div class="swiper-container full-h animation-2 swiper-control-top"
                                        data-mode="horizontal" data-autoplay="0" data-effect="slide"
                                        data-slides-per-view="1" data-loop="0" data-speed="600">
                                        <div class="swiper-wrapper">
                                            <div class="swiper-slide activeSlide">
                                                <div class="content">
                                                    <img src="{$_modx->resource.image}" alt=""
                                                        class="full-img">
                                                </div>
                                            </div>
                                           
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="empty-sm-10 empty-xs-10"></div>
         
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-7 col-xs-12">
                        <div class="empty-sm-55 empty-xs-30"></div>

                        <!-- aside>
                            <div class="empty-sm-10 empty-xs-10"></div>
                            <h4 class="h4 sm color-2">Price: <span class="main-col"><b>${$price}</b></span></h4>
                        </aside -->

                        <div class="empty-sm-35 empty-xs-20"></div>
     
                        <div class="empty-sm-30 empty-xs-20"></div>
                        <aside>
                            <div class="simple-text">
                                <p>{$_modx->resource.introtext}</p>
                            </div>
                        </aside>
                        <div class="empty-sm-30 empty-xs-20"></div>
              
                        <div class="empty-sm-40 empty-xs-25"></div>
                 
                        <div class="empty-sm-40 empty-xs-25"></div>
                        <aside>
                            <div class="follow follow-style-1 sm mob-center">
                                <h5 class="h5 sm follow-title">{"share"|lexicon}:</h5>

                                <div class="likely">
                                    <div class="facebook">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" viewBox="0 0 155.139 155.139" style="enable-background:new 0 0 155.139 155.139;" xml:space="preserve" width="16px" height="16px"><g>
                                        <path id="f_1_" d="M89.584,155.139V84.378h23.742l3.562-27.585H89.584V39.184   c0-7.984,2.208-13.425,13.67-13.425l14.595-0.006V1.08C115.325,0.752,106.661,0,96.577,0C75.52,0,61.104,12.853,61.104,36.452   v20.341H37.29v27.585h23.814v70.761H89.584z"  ></path></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g>
                                    </svg>
                                    </div>
                                    <div class="twitter"> 
                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                                            version="1.1" id="Layer_1" x="0px" y="0px" viewBox="0 0 310 310"
                                            style="enable-background:new 0 0 310 310;" xml:space="preserve" width="16px"
                                            height="16px">
                                            <g id="XMLID_826_">
                                                <path id="XMLID_827_"
                                                    d="M302.973,57.388c-4.87,2.16-9.877,3.983-14.993,5.463c6.057-6.85,10.675-14.91,13.494-23.73   c0.632-1.977-0.023-4.141-1.648-5.434c-1.623-1.294-3.878-1.449-5.665-0.39c-10.865,6.444-22.587,11.075-34.878,13.783   c-12.381-12.098-29.197-18.983-46.581-18.983c-36.695,0-66.549,29.853-66.549,66.547c0,2.89,0.183,5.764,0.545,8.598   C101.163,99.244,58.83,76.863,29.76,41.204c-1.036-1.271-2.632-1.956-4.266-1.825c-1.635,0.128-3.104,1.05-3.93,2.467   c-5.896,10.117-9.013,21.688-9.013,33.461c0,16.035,5.725,31.249,15.838,43.137c-3.075-1.065-6.059-2.396-8.907-3.977   c-1.529-0.851-3.395-0.838-4.914,0.033c-1.52,0.871-2.473,2.473-2.513,4.224c-0.007,0.295-0.007,0.59-0.007,0.889   c0,23.935,12.882,45.484,32.577,57.229c-1.692-0.169-3.383-0.414-5.063-0.735c-1.732-0.331-3.513,0.276-4.681,1.597   c-1.17,1.32-1.557,3.16-1.018,4.84c7.29,22.76,26.059,39.501,48.749,44.605c-18.819,11.787-40.34,17.961-62.932,17.961   c-4.714,0-9.455-0.277-14.095-0.826c-2.305-0.274-4.509,1.087-5.294,3.279c-0.785,2.193,0.047,4.638,2.008,5.895   c29.023,18.609,62.582,28.445,97.047,28.445c67.754,0,110.139-31.95,133.764-58.753c29.46-33.421,46.356-77.658,46.356-121.367   c0-1.826-0.028-3.67-0.084-5.508c11.623-8.757,21.63-19.355,29.773-31.536c1.237-1.85,1.103-4.295-0.33-5.998   C307.394,57.037,305.009,56.486,302.973,57.388z"
                                                     ></path>
                                            </g> 
                                        </svg>
                                    </div>               
                                </div> 
                            </div>
                        </aside>
                    </div>
                </div>
            </div>
        </section>

        <section class="section">
            <div class="empty-lg-80 empty-md-60 empty-sm-50 empty-xs-30"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-12 col-xs-12">
                        <div class="text-center">
                            <ul class="item-tabs type-2">
                                <li class="active"><a href="#" class="link-hover-line type-2">{"description.title"|lexicon}</a></li>
                            </ul>
                        </div>
                        <div class="tab-container-wraps">
                            <div class="tab-container-item min-h-430">
                                <div class="empty-sm-60 empty-xs-30"></div>
                                <div class="simple-text">
                                    {$_modx->resource.content}
                                </div>
                                <div class="empty-sm-45 empty-xs-20"></div> 
                            </div> 
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
    </div>


{/block}