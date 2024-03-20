<form hx-swap="outerHTML" hx-post="/contacts" >
    
    Name: <input 
    {if isset="$form_data.name"} value="{$form_data.name/}" {/if}
    type="text" name="name"/>
    
    
    Email: <input 
    {if isset="$form_data.email"} value="{$form_data.email/}" {/if}
    type="email" name="email"/>
    
    {foreach from="$form_data.errors" item="item"}
        <div style="color: red">{$item/}</div>
    {/foreach}
    <button type="submit"> Create Contact</button>
</form>