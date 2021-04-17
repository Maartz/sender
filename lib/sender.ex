defmodule Sender do

  def send_email("konnichiwa@world.com" = email), do:
    raise "Oops, couldn't send email to #{email}!"

 def send_email(email) do
    random_waiting_time = :crypto.rand_uniform(1000, 4000)
    Process.sleep(random_waiting_time)
    IO.puts("Email to #{email} sent")
    {:ok, email}
  end
  def notify_all(emails) do
    emails
    |> Task.async_stream(&send_email/1, ordered: false, on_timeout: :kill_task)
    |> Enum.to_list()
  end

end
