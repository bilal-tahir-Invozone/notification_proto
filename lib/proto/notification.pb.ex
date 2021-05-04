defmodule Notificationapi.GetTokenRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          userid: String.t()
        }

  defstruct [:userid]

  field :userid, 1, type: :string
end

defmodule Notificationapi.GetTokenResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          usertoken: [Notificationapi.Usertoken.t()]
        }

  defstruct [:usertoken]

  field :usertoken, 1, repeated: true, type: Notificationapi.Usertoken
end

defmodule Notificationapi.Usertoken do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          userid: String.t(),
          token: String.t()
        }

  defstruct [:userid, :token]

  field :userid, 1, type: :string
  field :token, 2, type: :string
end

defmodule Notificationapi.DelTokenRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          userid: String.t()
        }

  defstruct [:userid]

  field :userid, 1, type: :string
end

defmodule Notificationapi.DelTokenResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          status: boolean
        }

  defstruct [:status]

  field :status, 1, type: :bool
end

defmodule Notificationapi.SaveTokenRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          userid: String.t(),
          token: String.t()
        }

  defstruct [:userid, :token]

  field :userid, 1, type: :string
  field :token, 2, type: :string
end

defmodule Notificationapi.SaveTokenResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          status: boolean
        }

  defstruct [:status]

  field :status, 1, type: :bool
end

defmodule Notificationapi.GetNotificationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          userid: String.t()
        }

  defstruct [:userid]

  field :userid, 1, type: :string
end

defmodule Notificationapi.GetNotificationResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          notifis: [Notificationapi.Notifis.t()]
        }

  defstruct [:notifis]

  field :notifis, 1, repeated: true, type: Notificationapi.Notifis
end

defmodule Notificationapi.Notifis do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          onReact: String.t(),
          description: String.t(),
          receiver: String.t(),
          sender: String.t(),
          others: String.t(),
          sender_id: String.t()
        }

  defstruct [:onReact, :description, :receiver, :sender, :others, :sender_id]

  field :onReact, 1, type: :string
  field :description, 2, type: :string
  field :receiver, 3, type: :string
  field :sender, 4, type: :string
  field :others, 5, type: :string
  field :sender_id, 6, type: :string
end

defmodule Notificationapi.SaveNotificationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          title: String.t(),
          type: String.t(),
          sender: String.t(),
          sender_id: String.t(),
          receiver: String.t(),
          receiver_id: String.t(),
          onReact: String.t(),
          group: String.t(),
          postnumber: String.t(),
          description: String.t(),
          others: String.t()
        }

  defstruct [
    :title,
    :type,
    :sender,
    :sender_id,
    :receiver,
    :receiver_id,
    :onReact,
    :group,
    :postnumber,
    :description,
    :others
  ]

  field :title, 1, type: :string
  field :type, 2, type: :string
  field :sender, 3, type: :string
  field :sender_id, 4, type: :string
  field :receiver, 5, type: :string
  field :receiver_id, 6, type: :string
  field :onReact, 7, type: :string
  field :group, 8, type: :string
  field :postnumber, 9, type: :string
  field :description, 10, type: :string
  field :others, 11, type: :string
end

defmodule Notificationapi.SaveNotificationResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          title: String.t(),
          type: String.t(),
          sender: String.t(),
          sender_id: String.t(),
          receiver: String.t(),
          receiver_id: String.t(),
          onReact: String.t(),
          group: String.t(),
          postnumber: String.t(),
          description: String.t(),
          others: String.t()
        }

  defstruct [
    :title,
    :type,
    :sender,
    :sender_id,
    :receiver,
    :receiver_id,
    :onReact,
    :group,
    :postnumber,
    :description,
    :others
  ]

  field :title, 1, type: :string
  field :type, 2, type: :string
  field :sender, 3, type: :string
  field :sender_id, 4, type: :string
  field :receiver, 5, type: :string
  field :receiver_id, 6, type: :string
  field :onReact, 7, type: :string
  field :group, 8, type: :string
  field :postnumber, 9, type: :string
  field :description, 10, type: :string
  field :others, 11, type: :string
end

defmodule Notificationapi.Notification.Service do
  @moduledoc false
  use GRPC.Service, name: "Notificationapi.Notification"

  rpc :SaveNotification,
      Notificationapi.SaveNotificationRequest,
      Notificationapi.SaveNotificationResponse

  rpc :GetNotification,
      Notificationapi.GetNotificationRequest,
      Notificationapi.GetNotificationResponse

  rpc :SaveToken, Notificationapi.SaveTokenRequest, Notificationapi.SaveTokenResponse

  rpc :DelToken, Notificationapi.DelTokenRequest, Notificationapi.DelTokenResponse

  rpc :GetToken, Notificationapi.GetTokenRequest, Notificationapi.GetTokenResponse
end

defmodule Notificationapi.Notification.Stub do
  @moduledoc false
  use GRPC.Stub, service: Notificationapi.Notification.Service
end
