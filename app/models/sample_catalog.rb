class SampleCatalog
  Photo = Data.define(
    :slug,
    :title,
    :caption,
    :author_slug,
    :author_name,
    :author_handle,
    :image,
    :location,
    :camera,
    :published_at,
    :likes_count,
    :bookmarks_count,
    :comments_count,
    :tags,
    :mood,
    :following,
    :liked,
    :bookmarked
  )

  User = Data.define(
    :slug,
    :name,
    :handle,
    :bio,
    :location,
    :website,
    :avatar,
    :followers_count,
    :following_count,
    :photos_count,
    :likes_count,
    :bookmarks_count,
    :badges
  )

  Comment = Data.define(:author_name, :author_handle, :body, :published_at)

  class << self
    def current_user
      users.first
    end

    def users
      @users ||= [
        User.new(
          slug: "yui-tanaka",
          name: "Yui Tanaka",
          handle: "@yui",
          bio: "夕方の光と、静かな水面を追いかける写真を集めています。",
          location: "Tokyo, Japan",
          website: "https://example.com/yui",
          avatar: "samples/avatar-yui.svg",
          followers_count: 12_480,
          following_count: 321,
          photos_count: 84,
          likes_count: 18_904,
          bookmarks_count: 740,
          badges: ["Editor's Pick", "Film Lover", "Weekend Walker"]
        ),
        User.new(
          slug: "haru-sato",
          name: "Haru Sato",
          handle: "@haru",
          bio: "街灯と雨粒が作る反射に目がないです。",
          location: "Osaka, Japan",
          website: "https://example.com/haru",
          avatar: "samples/avatar-haru.svg",
          followers_count: 9_310,
          following_count: 208,
          photos_count: 57,
          likes_count: 12_442,
          bookmarks_count: 512,
          badges: ["Night Scene", "Street"]
        ),
        User.new(
          slug: "mina-kato",
          name: "Mina Kato",
          handle: "@mina",
          bio: "食べものと建築のディテールを近くから切り取ります。",
          location: "Kyoto, Japan",
          website: "https://example.com/mina",
          avatar: "samples/avatar-mina.svg",
          followers_count: 7_981,
          following_count: 294,
          photos_count: 43,
          likes_count: 11_039,
          bookmarks_count: 401,
          badges: ["Color", "Architecture"]
        ),
        User.new(
          slug: "reo-mori",
          name: "Reo Mori",
          handle: "@reo",
          bio: "山の稜線と雲の流れを中心に記録しています。",
          location: "Nagano, Japan",
          website: "https://example.com/reo",
          avatar: "samples/avatar-reo.svg",
          followers_count: 6_124,
          following_count: 175,
          photos_count: 31,
          likes_count: 8_620,
          bookmarks_count: 267,
          badges: ["Landscape", "Travel"]
        )
      ]
    end

    def photos
      @photos ||= [
        Photo.new(
          slug: "harbor-glow",
          title: "Harbor Glow",
          caption: "港の朝に残る、まだ冷たい空気と橙色の反射。",
          author_slug: "yui-tanaka",
          author_name: "Yui Tanaka",
          author_handle: "@yui",
          image: "samples/photo-harbor-glow.svg",
          location: "Yokohama Bay",
          camera: "FUJIFILM X-T5",
          published_at: Time.zone.parse("2026-07-21 07:20"),
          likes_count: 480,
          bookmarks_count: 72,
          comments_count: 18,
          tags: ["#sunrise", "#water", "#minimal"],
          mood: "calm",
          following: true,
          liked: true,
          bookmarked: true
        ),
        Photo.new(
          slug: "rainwalk-lights",
          title: "Rainwalk Lights",
          caption: "雨上がりの歩道に映るネオンの線を、少し長めの露出で。",
          author_slug: "haru-sato",
          author_name: "Haru Sato",
          author_handle: "@haru",
          image: "samples/photo-rainwalk-lights.svg",
          location: "Dotonbori",
          camera: "Nikon Zf",
          published_at: Time.zone.parse("2026-07-20 21:05"),
          likes_count: 612,
          bookmarks_count: 94,
          comments_count: 26,
          tags: ["#rain", "#city", "#neon"],
          mood: "electric",
          following: false,
          liked: false,
          bookmarked: true
        ),
        Photo.new(
          slug: "midday-steps",
          title: "Midday Steps",
          caption: "階段の影がつくる幾何学を、白い壁と合わせて整理した一枚。",
          author_slug: "mina-kato",
          author_name: "Mina Kato",
          author_handle: "@mina",
          image: "samples/photo-midday-steps.svg",
          location: "Kyoto Station",
          camera: "Leica Q3",
          published_at: Time.zone.parse("2026-07-19 12:40"),
          likes_count: 289,
          bookmarks_count: 45,
          comments_count: 11,
          tags: ["#architecture", "#shadow", "#lines"],
          mood: "clean",
          following: false,
          liked: true,
          bookmarked: false
        ),
        Photo.new(
          slug: "ridge-clouds",
          title: "Ridge Clouds",
          caption: "稜線に沿って流れる雲を、青のグラデーションで受け止める。",
          author_slug: "reo-mori",
          author_name: "Reo Mori",
          author_handle: "@reo",
          image: "samples/photo-ridge-clouds.svg",
          location: "Norikura Highlands",
          camera: "SONY α7R V",
          published_at: Time.zone.parse("2026-07-18 16:10"),
          likes_count: 731,
          bookmarks_count: 136,
          comments_count: 32,
          tags: ["#mountain", "#clouds", "#travel"],
          mood: "vast",
          following: false,
          liked: false,
          bookmarked: true
        ),
        Photo.new(
          slug: "cafe-tilt",
          title: "Cafe Tilt",
          caption: "午後のカフェで、窓辺に落ちた影だけを少し傾けて切り取る。",
          author_slug: "yui-tanaka",
          author_name: "Yui Tanaka",
          author_handle: "@yui",
          image: "samples/photo-cafe-tilt.svg",
          location: "Shibuya",
          camera: "RICOH GR IIIx",
          published_at: Time.zone.parse("2026-07-17 15:00"),
          likes_count: 201,
          bookmarks_count: 29,
          comments_count: 8,
          tags: ["#indoor", "#coffee", "#light"],
          mood: "soft",
          following: true,
          liked: false,
          bookmarked: false
        ),
        Photo.new(
          slug: "harvest-blue",
          title: "Harvest Blue",
          caption: "畑と空の境目にだけ残る青を、赤い果実で引き締めた。",
          author_slug: "mina-kato",
          author_name: "Mina Kato",
          author_handle: "@mina",
          image: "samples/photo-harvest-blue.svg",
          location: "Nagano Fields",
          camera: "Canon EOS R5",
          published_at: Time.zone.parse("2026-07-16 18:45"),
          likes_count: 352,
          bookmarks_count: 61,
          comments_count: 14,
          tags: ["#color", "#field", "#season"],
          mood: "fresh",
          following: false,
          liked: true,
          bookmarked: true
        ),
        Photo.new(
          slug: "studio-quiet",
          title: "Studio Quiet",
          caption: "余白のあるスタジオで、形と影だけが会話している時間。",
          author_slug: "haru-sato",
          author_name: "Haru Sato",
          author_handle: "@haru",
          image: "samples/photo-studio-quiet.svg",
          location: "Namba",
          camera: "SIGMA fp L",
          published_at: Time.zone.parse("2026-07-15 10:30"),
          likes_count: 184,
          bookmarks_count: 21,
          comments_count: 6,
          tags: ["#studio", "#shape", "#texture"],
          mood: "quiet",
          following: false,
          liked: false,
          bookmarked: false
        )
      ]
    end

    def featured_photo
      randomized_photos.first
    end

    def randomized_photos
      photos.shuffle(random: Random.new)
    end

    def liked_photos
      photos.select(&:liked)
    end

    def user_photos(slug)
      photos.select { |photo| photo.author_slug == slug }
    end

    def find_photo(slug)
      photos.find { |photo| photo.slug == slug } || photos.first
    end

    def find_user(slug)
      users.find { |user| user.slug == slug } || users.first
    end

    def bookmarked_photos
      photos.select(&:bookmarked)
    end

    def about_sections
      [
        {
          title: "このサイトについて",
          body: "PhotoApp は、ランダムに流れてくる写真を1枚ずつ楽しむスマホ中心のプロトタイプです。"
        },
        {
          title: "使い方",
          body: "スワイプか矢印キーで次の写真へ移動します。グローバルナビはハンバーガーメニューにまとめています。"
        },
        {
          title: "今後の追加予定",
          body: "足りない要素はあとから追加できるよう、仮データと画面部品を分けて組んでいます。"
        }
      ]
    end
  end
end
