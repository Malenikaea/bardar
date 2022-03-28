<form class="online-form" method="post" id="form">
    <div class="col-md-6 col-sm-6 col-xs-6">
        <input type="text" class="form-control" name="firstname" placeholder="{'form.firstname'|lexicon} *" required />
    </div>
    <div class="col-md-6 col-sm-6 col-xs-6">
        <input type="text" class="form-control" name="phone" placeholder="{'form.phone'|lexicon} *" required />
    </div>
    <div class="form-group col-md-6 col-sm-6 col-xs-6">
        <select name="type">
            <option value="" selected>{"form.select"|lexicon}</option>
            <option value="Horeca">HoReCa</option>
            <option value="Retail">Retail</option>
        </select>
    </div>
    <div class="col-md-6 col-sm-6 col-xs-6">
        <input type="text" class="form-control" name="address" placeholder="{'form.address'|lexicon} *" required />
    </div>

    <button type="submit" class="btn-red">{"form.submit"|lexicon}</button>

    <input type="hidden" name="email2">

    {'!rcv3_html' | snippet : [
        'action' => $rcv3Action,
        'error' => $_modx->getPlaceholder('fi.error.g-recaptcha-response'),
    ]}
</form>