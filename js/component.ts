/**
 * @class {TodoCard} TodoCard - todo-card
 * @extends HTMLElement
 * @method {any} render () - method to render element
 */
class TodoCard extends HTMLElement {
    constructor() {
        super();
        // Attach a shadow DOM for encapsulation
        this.attachShadow({ mode: 'open' });
    }

    completeTask() { }

    editTask() { }

    nestTask() { }

    appendTask() { }

    calculatePercentDone() { }

    connectedCallback() {
        // Called when the component is added to the DOM
        this.render();
    }
    if(this.shadowRoot == null) {
    return
}

render() {
    // Simple template for your component
    this.shadowRoot.innerHTML = `
      <style>
        /* Scoped styles go here */
      </style>
      <div>

      </div>
    `;
}
}

customElements.define('todo-card', TodoCard);
window.addEventListener("load", app)
function app(e) {
    e.preventDefault()
}
