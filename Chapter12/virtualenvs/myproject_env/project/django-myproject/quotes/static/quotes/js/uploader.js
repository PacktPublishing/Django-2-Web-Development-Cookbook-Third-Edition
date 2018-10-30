(function($) {
    var SELECTORS = {
        CSRF_TOKEN: "input[name='csrfmiddlewaretoken']",
        PICTURE: "input[type='file'][name='picture']",
        PATH: "input[name='picture_path']"
    };

    var DEFAULTS = {
        labels: {
            "Select": "Select File"
        }
    };

    function Uploader(form, uploadUrl, options) {
        if (form && uploadUrl) {
            this.form = form;
            this.url = uploadUrl;

            this.processOptions(options);
            this.gatherFormElements();
            this.wrapFileField();
            this.setupFileUpload();
        }
    }

    Uploader.prototype.mergeObjects = function(source, target) {
        var self = this;
        Object.keys(source).forEach(function(key) {
            var sourceVal = source[key];
            var targetVal = target[key];
            if (!target.hasOwnProperty(key)) {
                target[key] = sourceVal;
            } else if (typeof sourceVal === "object"
                && typeof targetVal === "object") {
                self.mergeObjects(sourceVal, targetVal);
            }
        });
    };

    Uploader.prototype.processOptions = function(options) {
        options = options || {};
        this.mergeObjects(DEFAULTS, options);
        this.options = options;
    };

    Uploader.prototype.gatherFormElements = function() {
        this.csrf = this.form.querySelector(SELECTORS.CSRF_TOKEN);
        this.picture = this.form.querySelector(SELECTORS.PICTURE);
        this.path = this.form.querySelector(SELECTORS.PATH);

        this.createButton();
        this.createContainer();
    };

    Uploader.prototype.createButton = function() {
        var label = this.options.labels["Select Picture"];
        this.button = document.createElement("button");
        this.button.appendChild(document.createTextNode(label));
        this.button.setAttribute("type", "button");
        this.button.classList.add(
            "btn", "btn-primary", "fileinput-button");
    };

    Uploader.prototype.createContainer = function() {
        this.container = document.createElement("table");
        this.container.setAttribute("role", "presentation");
        this.container.classList.add("table", "table-striped");

        this.list = document.createElement("tbody");
        this.list.classList.add("files");
        this.container.appendChild(this.list);
    };

    Uploader.prototype.wrapFileField = function() {
        this.picture.parentNode.insertBefore(
            this.button, this.picture);
        this.button.appendChild(this.picture);
        this.button.parentNode.insertBefore(
            this.container, this.button);
    };

    Uploader.prototype.setupFileUpload = function() {
        var self = this;

        $.ajaxSettings.headers = $.ajaxSettings.headers || {};
        $.ajaxSettings.headers["X-CSRFToken"] = this.csrf.value;

        $(this.form).fileupload({
            url: this.url,
            dataType: 'json',
            acceptFileTypes: /^image\/(gif|p?jpeg|jpg|png)$/,
            autoUpload: false,
            replaceFileInput: true,
            messages: self.options.labels,
            maxNumberOfFiles: 1
        }).on("fileuploaddone", function(e, data) {
            self.path.value = data.result.files[0].path;
        }).on("fileuploaddestroy", function(e, data) {
            self.path.value = "";
        });
    };

    window.Uploader = Uploader;
}(jQuery));
