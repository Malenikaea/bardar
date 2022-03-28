<form class="row"  method="post" id="form">
    <div class="form-group col-md-6">
        <input type="text" id="input_fname" name="firstname" required placeholder="{'form.firstname'|lexicon}" class="form-control">
    </div>
    <div class="form-group col-md-6">
        <input type="text" id="input_lname" name="company" required placeholder="{'form.company'|lexicon}" class="form-control">
    </div>
    <div class="form-group col-md-6">
        <input type="email" id="input_email" name="email" required  placeholder="Email" class="form-control">
    </div>
    <div class="form-group col-md-6">
        <input type="text" id="input_phone" require  name="phone" placeholder="{'form.phone'|lexicon}" class="form-control">
    </div>
    <div class="form-group col-md-12">
        <input type="text" id="input_coutry" name="country"  placeholder="{'form.country'|lexicon}" class="form-control">
    </div>
    <div class="form-group col-md-12">
        <textarea id="textarea_message" name="message" placeholder="{'form.message'|lexicon}" rows="6" class="form-control"></textarea>
    </div>
    <input type="submit" title="{"form.submit"|lexicon}"  value="{"form.submit"|lexicon}" id="btn_submit" name="{"form.submit"|lexicon}">
    <div id="alert-msg" class="alert-msg" style="display: none">{"form.success"|lexicon}</div>

    <input type="hidden" name="email2">

    {'!rcv3_html' | snippet : [
        'action' => $rcv3Action,
        'error' => $_modx->getPlaceholder('fi.error.g-recaptcha-response'),
    ]}

</form>