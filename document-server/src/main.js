import './style.css'

document.querySelector('button').addEventListener('click', () => {
  console.log('clicked');
  window.flutter_inappwebview.callHandler('onEvent', 'eventData', 123);
})

document.querySelector('#now').textContent = new Date().toISOString()