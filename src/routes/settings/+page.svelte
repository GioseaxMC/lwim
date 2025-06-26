<script>
    import { user, api, getContrastColor } from "$lib/store.svelte";
    import Input from "$lib/components/ui/Input.svelte";
    import Button from "$lib/components/ui/Button.svelte";
    import { goto } from "$app/navigation";
    import { onMount } from "svelte";

    onMount(()=>{
        if (!user.id) {
            goto("login");
        }
    })

    let color_copy = user.colorscheme;
    let color = $state(color_copy);
    let error_message = $state();

    async function send_settings(e) {
        e.preventDefault();

        let formdata = new FormData(e.target);
        formdata.append("session", user.token);
        let response = await fetch(api + "set_settings.php", {
            method: "POST",
            body: formdata,
        });

        if (response.ok) {
            user.display = formdata.get("display");
            user.pfp = formdata.get("pfp");
            user.colorscheme = formdata.get("color");
            error_message = "";
        } else {
            error_message = await response.text();
        }

    }

</script>

<style>

.container {
    display: grid;
    gap: 5px;
    background-color: var(--primary);
    border: 1px var(--border) solid;
    padding: 20px;
    border-radius: var(--border-radius);
    width: 700px;
}

.center-container {
	display: flex;
	justify-content: center;
	margin: 15px;
}

.grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 20px;
}

p {
    font-size: 75%;
    margin-bottom: 10px;
}

input[type="color"] {
    margin: 0;
    border-radius: var(--border-radius-2);
    border: 1px var(--border) solid;
    height: 31px;
    width: 100%;
}

input[type="color"]::-webkit-color-swatch-wrapper {
	padding: 0;
}
input[type="color"]::-webkit-color-swatch {
	border: none;
}

</style>

<div class="center-container">
    <div class="container">
        <form onsubmit={send_settings}>
            <h3>Settings</h3>
            <hr style="margin: 20px 0;">
            <div class="grid">
                <div>
                    <p>Display name:</p>
                    <Input name="display" buffer={user.display}/>
                </div>
                <div>
                    <p>Colorscheme:</p>
                    <input name="color" type="color" bind:value={user.colorscheme}/>
                </div>
                <div>
                    <p>Profile picture:</p>
                    <Input name="pfp" buffer={user.pfp}/>
                </div>
            </div>
            <br>
            <p style="color: var(--red)" class="st">{error_message}</p>
            <Button text="Update" type="submit"/>
        </form>
    </div>
</div>