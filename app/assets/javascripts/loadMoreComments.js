var Append = {};
Append.open = false;
function ClickableCommentsLink(){
  $('.more-comments').click( function() {
    $(this).on('ajax:success', function(event, data, status,xhr) {
      var postId = $(this).data("post-id");
      $("#comments_" + postId).html(data);
      $("#comments-paginator-" + postId).html("<a id='more-comments' data-post-id=" + postId + "data-type='html' data-remote='true' href='/posts/" + postId + "/comments>show morecomments</a>");
      Append.open = true;
      Append.comment = true; //Setting the value of Append.comment to true
      Append.link = false;  //Setting the value of Append.link to false, as we don't want to append a link to the end
    }); 
  });
}

function DestroyComments(){
  $('.delete-comment').click( function() {
    Append.id = this;
    Append.post_id = $(this).data("post-id");
    Append.comment_count = $(this).data("value");
  }); 
}

$( document ).ready(function() {
  ClickableCommentsLink();
  DestroyComments();
  $('.comment_content').click (function(){
  	Append.id = this;
  	Append.post_id = $(this).data("post-id");
  	if (Append.comment_count == undefined){ Append.comment_count = $(this).data("value"); }
  	if(Append.comment_count < 4){ Append.comment = true; Append.link = false; } //Setting the value of Append.comment to true
  	else if(Append.comment_count == 4){ Append.comment = false; Append.link = true; } //Setting the value of Append.comment to false, and append.comment_link to true
  	else if(Append.comment_count > 4){ Append.comment = false; Append.link = false;  } //Setting the value of append.comment_link to false
  })
});
