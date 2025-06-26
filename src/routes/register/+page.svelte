<script module>
    import "$lib/env.svelte";
    import Input from "$lib/components/ui/Input.svelte";
    import Button from "$lib/components/ui/Button.svelte";
    import { dev } from "$app/environment";
    import { api, base } from "$lib/store.svelte";

    let username = $state("");
    let password = $state("");
    let password_2 = $state("");
    let error_message = $state("");

    let usern = $derived(username.length ? username : "user");

</script>
<style>

.login {
    display: grid;
    gap: 5px;
    border: 1px var(--border) solid;
    background-color: var(--primary);
    padding: 20px;
    border-radius: var(--border-radius);
    width: 300px;
}

.center-container {
	display: flex;
	justify-content: center;
	margin: 15px;
}

</style>

<script>

function handle_login(e) {
    e.preventDefault();

    if (password !== password_2) {
        error_message = "Passwords don't match.";
        return;
    }
    
    if (
        !password.length ||
        !password_2.length ||
        !username.length
    ) {
        error_message = "Please fill all field (pun intended).";
        return;
    }
    
    const formdata = new FormData(e.target);
    for (const [key, value] of formdata.entries()) {
        console.log(`${key}: ${value}`);
    };

    fetch(
        api + "register.php", {
        method: "POST",
        body: formdata,
    }).then( response => {
        if (response.status >= 200 && response.status < 300) {
            window.location.href = base+"login";
        } else {
            response.text().then(text => {
                error_message = text;
            });
        }
    });
    
}

</script>

<div class="center-container">
    <div class="login">
        <h3>Register</h3>
        <p class="st" style="color: var(--text-second)">Hello {usern}!</p>
        <br>
        <form onsubmit={handle_login} autocomplete="on">
            <label for="username" class="st">
                Username
                <br>
            </label>
            <Input id="username" name="username" autocomplete="username" bind:buffer={username}/>
            <br>
            <br>
            <label for="password" class="st">
                Password
                <br>
            </label>
            <Input id="password" name="password" autocomplete="new-password" type="password" bind:buffer={password}/>
            <br>
            <br>
            <label for="password-2" class="st">
                Password again
                <br>
            </label>
            <Input id="password-2" name="password-2" autocomplete="new-password" type="password" bind:buffer={password_2}/>
            <br>
            <br>
            <p class="st" style="color: var(--red);">{error_message}</p>
            <br>
            <Button type="submit" text="Register"/>
        </form>
    </div>
</div>