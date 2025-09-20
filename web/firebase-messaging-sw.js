// firebase-messaging-sw.js
importScripts('https://www.gstatic.com/firebasejs/10.12.2/firebase-app-compat.js');
importScripts('https://www.gstatic.com/firebasejs/10.12.2/firebase-messaging-compat.js');

// **Step 1: Firebase कॉन्फ़िगरेशन पेस्ट करें**
const firebaseConfig = {
  apiKey: "AIzaSyCyGEU8n1brGWv_alrFi93oMVH4bVedfCo",
  authDomain: "auth-ddefd.firebaseapp.com",
  projectId: "auth-ddefd",
  storageBucket: "auth-ddefd.firebasestorage.app",
  messagingSenderId: "525799943137",
  appId: "1:525799943137:web:c103425b647080d51480a0",
  measurementId: "G-56GMW9JSQ6"
};

firebase.initializeApp(firebaseConfig);
const messaging = firebase.messaging();

// **Step 2: बैकग्राउंड मैसेज को हैंडल करें**
messaging.onBackgroundMessage((payload) => {
  console.log('Background message received: ', payload);
  const notificationTitle = payload.notification.title;
  const notificationOptions = {
    body: payload.notification.body,
    icon: '/firebase-logo.png' // आप यहाँ कोई कस्टम आइकॉन जोड़ सकते हैं
  };
  // यह लाइन बैकग्राउंड में भी नोटिफिकेशन दिखाने के लिए है
  return self.registration.showNotification(notificationTitle, notificationOptions);
});