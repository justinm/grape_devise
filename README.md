GrapeDevise
##########
GrapeDevise is a plugin for adding support for devise helpers in grape APIs.

Usage
#####

The GrapeDevise API can be used inside of Grape request blocks (ie. get, post).

```
class MyAPI < Grape::API
    get "/requires-authentication" do
        authenticate_user!
    end
    
    get "/who-am-i" do
        current_user
    end
end

```
