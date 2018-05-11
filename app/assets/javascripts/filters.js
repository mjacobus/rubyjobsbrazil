jQuery(document).ready(function () {
    $('[data-filter-select]').change(function () {
        var options               = $(this).data('filter-select');
        options                   = $.extend({ url: '/filters' }, options);
        var data                  = options.data ? options.data : {};
        data[options.filterParam] = $(this).val();
        data['filter']            = options.filter;
        var element               = $(options.target);

        $.ajax({
            url: options.url,
            data: data,
            success: function (json) {
                populateSelect(element, json, { id: "", name: "selecione" } );
            }
        });
    });
});

function populateSelect(element, options, first) {
    element.html('');

    if (first) {
        appendOptionToSelect(element, first.id, first.name);
    }

    for (var i = 0; i < options.length; ++i) {
        appendOptionToSelect(element, options[i].id, options[i].name);
    }
}

function appendOptionToSelect(element, value, label) {
    var option = ['<option value="', value, '">', label, '</option>' ].join('');
    element.append(option);
}
