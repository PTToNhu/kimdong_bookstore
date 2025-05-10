export function toggleCommentBox(index) {
  var commentBox = document.getElementById(`comment-box-${index}`);
  var allComments = document.querySelectorAll(".comment-box");
  var btn = document.querySelector(".btn");
  allComments.forEach(function (comment) {
    if (!comment.classList.contains("hidden") && comment != commentBox) {
      comment.classList.add("hidden");
    }
  });
  if (!btn.classList.contains("hidden")) {
    btn.classList.add("hidden");
  }
  commentBox.classList.toggle("hidden");
}
export function toggleButton() {
  var btn = document.querySelector(".btn");
  btn.classList.toggle("hidden");
  var allComments = document.querySelectorAll(".comment-box");
  allComments.forEach(function (comment) {
    if (!comment.classList.contains("hidden")) {
      comment.classList.add("hidden");
    }
  });
}
