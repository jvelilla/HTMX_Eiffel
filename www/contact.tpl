 <div class="contact" id="contact-{$item.id/}" style="display: flex">
        <div 
          hx-indicator="#ci-{$item.id/}" 
          hx-target="#contact-{$item.id/}" 
          hx-swap="outerHTML swap:500ms" 
          hx-delete="/contacts/{$item.id/}" style="width: 1rem; cursor: pointer">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
            <path fill="none" d="M0 0h24v24H0z"/>
            <path d="M4 2h16a1 1 0 011 1v1a1 1 0 01-1 1H4a1 1 0 01-1-1V3a1 1 0 011-1zM3 6h18v16a1 1 0 01-1 1H4a1 1 0 01-1-1V6zm3 3v9a1 1 0 002 0v-9a1 1 0 00-2 0zm5 0v9a1 1 0 002 0v-9a1 1 0 00-2 0zm5 0v9a1 1 0 002 0v-9a1 1 0 00-2 0z"/>
          </svg>
        </div>  
        <field>Name: <span>{$item.name/}</span></field>
        <field>Email: <span>{$item.email/}</span></field>

        <div id="ci-{$item.id/}" class="htmx-indicator">
          <img src="{$host/}/infinite-spinner.svg" alt="loading" style="width: 1rem">
        </div>

</div>