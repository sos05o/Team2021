from slack_bolt import App
from slack_sdk.errors import SlackApiError
import environ

env = environ.Env()
env.read_env('.env')


app = App(
    token=env('TOKEN'),
)


def send_message_for_email(mail_message: list):
    """mail_message[{email:string, message:string}, {}, {}...]"""
    for array in mail_message:
        data = get_user_id_for_email(email_addr=array['email'])
        if not data['ok']:
            exit()
        try:
            app.client.chat_postMessage(channel=data['user']['id'], text=array['message'])
            return True
        except SlackApiError as e:
            print(e)
            return False


def get_user_id_for_email(email_addr):
    try:
        id_dict = app.client.users_lookupByEmail(email=email_addr)
    except SlackApiError:
        print('The user_id corresponding to the email address used was not found.')
        return {'ok': False}
    return id_dict


if __name__ == '__main__':
    message_list = [
        {"email": "k.sugisawa.sys20@morijyobi.ac.jp", "message": "send as test message"}
    ]
    send_message_for_email(message_list)
