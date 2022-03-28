<!-- Order Section 1 -->
<div class="order-section order-section-1 container-fluid no-padding" id="form-section">
    <div class="section-padding"></div>
    <div class="container">
        <div class="section-header">
            <h3>{'catalog.form.title'|lexicon}</h3>
            <h5>{'catalog.form.subtitle'|lexicon}</h5>
            <img src="uploads/section-seprator.png" alt="section-seprator" width="169" height="15">
            <br>
            <p>{'catalog.form.description'|lexicon}</p>
        </div><!-- Section Header /-  -->

        <form id="form" method="post">
            <div class="col-md-4 col-sm-4 col-xs-4">
                <input type="text" class="form-control" name="firstname" placeholder="{'form.firstname'|lexicon} *" required />
            </div>
            <div class="col-md-4 col-sm-4 col-xs-4">
                <input type="text" class="form-control" name="phone" placeholder="{'form.phone'|lexicon}  *" required />
            </div>
            <div class="form-group col-md-4 col-sm-4 col-xs-4">
                <select name="type">
                    <option value="" selected>{"form.select"|lexicon}</option>
                    <option value="Horeca">HoReCa</option>
                    <option value="Retail">Retail</option> 
                </select>
            </div>
            <div class="col-md-12 col-sm-12 col-xs-12">
                <textarea class="form-control" name="address" rows="4" placeholder="{'form.address'|lexicon} *"></textarea>
            </div>
            <div class="col-md-12 col-sm-12 col-xs-12 order-links">
                <button type="submit" class="order-now">{"form.submit"|lexicon}</button> 
            </div>
             
            <input type="hidden" name="email2">

            {'!rcv3_html' | snippet : [
                'action' => $rcv3Action,
                'error' => $_modx->getPlaceholder('fi.error.g-recaptcha-response'),
            ]}

        </form>
    </div><!-- Container /- -->
    <div class="section-padding"></div>
</div><!-- Order Section 1 /- -->