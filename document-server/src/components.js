customElements.define('custom-list', class extends HTMLElement {
  constructor() {
    super();
    this.attachShadow({ mode: 'open' });
  }

  connectedCallback() {
    this.render();
  }

  render() {
    this.shadowRoot.innerHTML = `
      <style>
        :host {
          display: block;
        }
      </style>
      <div class="content">
        <ul>
          <li>リンゴ</li>
          <li>バナナ</li>
          <li>オレンジ</li>
          <li>ぶどう</li>
          <li>メロン</li>
        </ul>
      </div>
    `;
  }
});