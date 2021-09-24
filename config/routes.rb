Rails.application.routes.draw do
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  resources :books
  root 'homes#top'
  get 'home/about' => 'homes#about'
end
#ヒント1 end追加
#ヒント3 resources users devise 入れ替え エラーがresources users#showを先に書くとuser/:idが先にマッチる=>user/sign_inにアクセスしてしまう