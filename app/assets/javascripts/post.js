var EditForm = {
  init: function() {
    $('.get-edit-comment').on('ajax:success', this.showEditModal);
  },

  showEditModal: function(e, data) {
    e.preventDefault();
    $('.reveal-modal').html(data.edit_template);
    $('.reveal-modal').foundation('reveal', 'open');
  }
}


$(document).ready( function() {
  EditForm.init();
});