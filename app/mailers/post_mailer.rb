class PostMailer < ApplicationMailer
  def post_mail(post)
    @post = post

    mail to: @post.user.email, subject: 'Picshareに写真を投稿しました'
  end
end
