defmodule Notificationapi.GetNotificationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          title: String.t(),
          type: String.t(),
          sender: String.t(),
          receiver: String.t(),
          onReact: String.t(),
          group: String.t(),
          postnumber: String.t()
        }

  defstruct [:title, :type, :sender, :receiver, :onReact, :group, :postnumber]

  field :title, 1, type: :string
  field :type, 2, type: :string
  field :sender, 3, type: :string
  field :receiver, 4, type: :string
  field :onReact, 5, type: :string
  field :group, 6, type: :string
  field :postnumber, 7, type: :string
end

defmodule Notificationapi.GetNotificationResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          notification: Notificationapi.Data.t() | nil
        }

  defstruct [:notification]

  field :notification, 1, type: Notificationapi.Data
end

defmodule Notificationapi.Data do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          onReact: String.t(),
          description: String.t(),
          receiver: String.t(),
          sender: String.t(),
          status: boolean
        }

  defstruct [:onReact, :description, :receiver, :sender, :status]

  field :onReact, 1, type: :string
  field :description, 2, type: :string
  field :receiver, 3, type: :string
  field :sender, 4, type: :string
  field :status, 5, type: :bool
end

defmodule Notificationapi.Notification.Service do
  @moduledoc false
  use GRPC.Service, name: "Notificationapi.Notification"

  rpc :GetNotification,
      Notificationapi.GetNotificationRequest,
      Notificationapi.GetNotificationResponse
end

defmodule Notificationapi.Notification.Stub do
  @moduledoc false
  use GRPC.Stub, service: Notificationapi.Notification.Service
end
