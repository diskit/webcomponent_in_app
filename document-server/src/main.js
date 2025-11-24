import './style.css'
import './components'

const resizableBlock = document.querySelector('#resizableBlock')
document.querySelector('button').addEventListener('click', () => {
  var h = parseInt(resizableBlock.style.height) || 100;
  resizableBlock.style.height = `${h+100}px`
})

document.querySelector('#now').textContent = new Date().toISOString()

const resizeObserver = new ResizeObserver(v => {
  window.flutter_inappwebview?.callHandler('onEvent', { type: "resize", height: document.body.scrollHeight});
})
resizeObserver.observe(document.body);
console.log(document.body.scrollHeight)