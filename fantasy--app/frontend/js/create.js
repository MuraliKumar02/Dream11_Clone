
  function toggleVisibility(id, icon) {
    const field = document.getElementById(id);
    if (field.type === "password") {
      field.type = "text";
      icon.classList.replace("fa-eye", "fa-eye-slash");
    } else {
      field.type = "password";
      icon.classList.replace("fa-eye-slash", "fa-eye");
    }
  }

  function checkStrength() {
    const password = document.getElementById("new-password").value;
    const bar = document.getElementById("strength-bar");
    let strength = 0;

    if (password.length >= 8) strength++;
    if (/[A-Z]/.test(password)) strength++;
    if (/[0-9]/.test(password)) strength++;
    if (/[@$!%*?&#]/.test(password)) strength++;

    bar.style.width = `${strength * 25}%`;
    bar.style.background = ["red", "orange", "yellowgreen", "green"][strength - 1] || "transparent";
  }

  async function validatePasswords() {
    const newPassword = document.getElementById("new-password").value.trim();
    const confirmPassword = document.getElementById("confirm-password").value.trim();

    // Client-side validations
    if (newPassword === "" || confirmPassword === "") {
      alert("Please fill out both password fields.");
      return;
    }

    if (newPassword.length < 8) {
      alert("Password must be at least 8 characters long.");
      return;
    }

    if (newPassword !== confirmPassword) {
      alert("Passwords do not match.");
      return;
    }

    // Optional: Check for more complex password rules here

    try {
      // Example payload: include email/token if needed
      const response = await fetch("https://your-backend.com/api/reset-password", {
        method: "POST",
        headers: {
          "Content-Type": "application/json"
        },
        body: JSON.stringify({
          password: newPassword,
          // email: "user@example.com", // Optional if required
          // token: "otp_or_token_from_previous_step" // Optional
        })
      });

      const result = await response.json();

      if (response.ok) {
        const box = document.getElementById("lockerBox");
        const icon = document.getElementById("lockIcon");
        icon.innerHTML = '<i class="fas fa-unlock"></i>';
        document.getElementById("unlock-sound").play();
        box.classList.add("unlocking");
        showToast();

        // Optional: redirect after delay
        setTimeout(() => {
          window.location.href = "html/login.html";
        }, 3000);
      } else {
        alert("Reset failed: " + (result.message || "Unknown error."));
      }
    } catch (err) {
      console.error("Error:", err);
      alert("Network or server error occurred.");
    }
  }

  function showToast() {
    const toast = document.getElementById("toast");
    toast.classList.add("show");
    setTimeout(() => toast.classList.remove("show"), 3000);
  }

