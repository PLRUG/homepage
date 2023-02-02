class DiscordGateway
  AVARAGE_ONLINE_MEMBERS = 27

  def online_members_count
    payload.presence_count
  end

  def members
    payload.members
  end

  def first_30_members
    members.first(30)
  end

  private

  def payload
    Rails.cache.fetch("discord_stats", expires_in: 30.minutes) do
      result = HTTP.get("https://discord.com/api/guilds/929727331621306379/widget.json")

      if result.status.success?
        JSON.parse(result.to_s, object_class: OpenStruct)
      else
        OpenStruct.new(
          members: [],
          presence_count: AVARAGE_ONLINE_MEMBERS
        )
      end
    end
  end
end
