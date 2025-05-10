// Helper function to validate email format
function isValidEmail(email) {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
  }
  
  // Send OTP to backend
  document.getElementById('sendOtpBtn').addEventListener('click', async () => {
    const email = document.getElementById('emailInput').value.trim();
  
    if (!isValidEmail(email)) {
      alert('Please enter a valid email address.');
      return;
    }
  
    try {
      const response = await fetch('https://your-backend.com/api/send-otp', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({ email: email })
      });
  
      const data = await response.json();
  
      if (response.ok) {
        alert('OTP sent to your email!');
      } else {
        alert('Error sending OTP: ' + data.message);
      }
    } catch (error) {
      alert('Server error while sending OTP.');
      console.error(error);
    }
  });
  
  // Auto move to next OTP input and handle backspace
  const otpBoxes = document.querySelectorAll('.otp-box');
  
  otpBoxes.forEach((box, index) => {
    box.addEventListener('input', () => {
      if (box.value.length === 1 && index < otpBoxes.length - 1) {
        otpBoxes[index + 1].focus();
      }
    });
  
    box.addEventListener('keydown', (e) => {
      if (e.key === 'Backspace' && box.value === '' && index > 0) {
        otpBoxes[index - 1].focus();
      }
    });
  });
  
  // Verify OTP with backend
  document.getElementById('verifyOtpBtn').addEventListener('click', async () => {
    const otp = Array.from(otpBoxes).map(box => box.value).join('');
  
    if (otp.length < 6) {
      alert('Please enter all 6 digits of the OTP.');
      return;
    }
  
    try {
      const response = await fetch('https://your-backend.com/api/verify-otp', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({ otp: otp })
      });
  
      const data = await response.json();
  
      if (response.ok) {
        alert('OTP verified successfully!');
        window.location.href = 'tml/create.html'; // Redirect on success
      } else {
        alert('OTP verification failed: ' + data.message);
      }
    } catch (error) {
      alert('Server error while verifying OTP.');
      console.error(error);
    }
  });
  