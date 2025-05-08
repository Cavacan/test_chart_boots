document.addEventListener("turbo:load", () => {
  const loginBtn = document.getElementById("loginBtn");
  const loading = document.getElementById("loading");

  loginBtn.addEventListener("click", () => {
    loading.classList.remove("d-none");
  });

});