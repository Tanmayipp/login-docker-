from django import forms

class CustomUserForm(forms.Form):
    username = forms.CharField(max_length=150, required=True)
    email = forms.EmailField(required=True)
    age = forms.IntegerField(min_value=1, max_value=120, required=True)
    password = forms.CharField(widget=forms.PasswordInput(), required=True)

    def clean_username(self):
        username = self.cleaned_data.get('username')
        if ' ' in username:
            raise forms.ValidationError("Username should not contain spaces.")
        return username
