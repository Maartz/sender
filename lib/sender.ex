defmodule Sender do
  def send_email(email) do
    random_waiting_time = :crypto.rand_uniform(1000, 4000)
    Process.sleep(random_waiting_time)
    IO.puts("Email to #{email} sent")
    {:ok, email}
  end

  def notify_all(emails) do
    Enum.each(emails, &send_email/1)
  end
end
