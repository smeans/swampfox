$(function () {
  $('.selectable').each(function () {
    $($(this).children()[0]).addClass('selected');
    $(this).click(do_select)
  });

  $('#if_queues').load(refresh_queues);
});

function do_select(event) {
  var $t = $(event.target)

  while (!$t.parent().hasClass('selectable')) {
    $t = $t.parent();
  }

  $t.parent().children().removeClass('selected');
  $t.addClass('selected');
}

function refresh_queues() {
  var ql = $.parseJSON($('#if_queues').contents().text());

  $('.queue').not('.template').remove();
  var qr = $('.queue.template')[0].outerHTML;
  $(ql).each(function () {
    var $rs = $(template_replace(qr, this));
    $rs.removeClass('template');
    $('.queues').append($rs);
  });
}

function template_replace(s, d) {
  var rs = s;

  for (k in d) {
    if (d.hasOwnProperty(k)) {
      var re = new RegExp('\{' + k + '\}', 'g');
      rs = rs.replace(re, d[k]);
    }
  }

  return rs;
}
