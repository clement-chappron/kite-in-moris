var loadFile = function(event) {
  var output = document.getElementById('profile-image');
  output.src = URL.createObjectURL(event.target.files[0]);
  output.onload = function() {
    URL.revokeObjectURL(output.src)
  }
};

document.addEventListener('DOMContentLoaded', function() {
  const form = document.getElementById('profile-picture-form');

  if (form) {
    form.addEventListener('ajax:success', function(event) {
      const [data, status, xhr] = event.detail;
      const newProfilePictureUrl = data.profile_picture_url;

      const profileImage = document.getElementById('profile-image');
      if (profileImage) {
        profileImage.src = newProfilePictureUrl;
      }
    });
  }
});
